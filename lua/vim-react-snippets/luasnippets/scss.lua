local util = require("vim-react-snippets.util")

local ls = require("luasnip")
local conds = require("luasnip.extras.expand_conditions")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local line_begin = { condition = conds.line_begin }

local use_modules = function()
  return {
    s({
      trig = "use",
      name = "Use File or Package",
    }, {
      t('@use "'),
      i(1),
      t('";'),
    }, line_begin),
    s({
      trig = "use*",
      name = "Use File or Package as *",
    }, {
      t('@use "'),
      i(1),
      t('" as *;'),
    }, line_begin),
    s({
      trig = "for",
      name = "Forward",
    }, {
      t('@forward "'),
      i(1),
      t({ '" with (', "\t" }),
      i(2),
      t({ "", ");" }),
    }, line_begin),
  }
end

local at_rules = function()
  return {
    s({
      trig = "fun",
      name = "@function",
    }, {
      t("@function "),
      i(1, "name"),
      t("("),
      i(2),
      t({ ") {", "\t" }),
      i(0),
      t({ "", "\t@return " }),
      i(3, "null"),
      t({ ";" }),
      t({ "", "}" }),
    }, line_begin),

    s({
      trig = "mix",
      name = "@mixin",
    }, {
      t("@mixin "),
      i(1, "name"),
      t("("),
      i(2),
      t({ ") {", "\t" }),
      i(0),
      t({ "", "}" }),
    }, line_begin),

    -- not used often
    s({
      trig = "pcs",
      name = "Prefers Color Scheme",
    }, {
      t("@media (prefers-color-scheme: "),
      i(1, "dark"),
      t({ ") {", "\t" }),
      i(2),
      t({ "", "}" }),
    }, line_begin),
  }
end

local libraries = function()
  return {
    s({
      trig = "conf",
      name = "configure()",
    }, {
      t("@mixin configure($"),
      i(1, "name"),
      t({ ": null) {", "\t" }),
      t("@if $"),
      util.mirror_node(1),
      t({ " {", "\t\t" }),
      t("$-"),
      util.mirror_node(1),
      t(": $"),
      util.mirror_node(1),
      t({ " !global;", "" }),
      t({ "\t}", "" }),
      i(0),
      t({ "", "}" }),
    }, line_begin),

    s({
      trig = "sg",
      name = "set global",
    }, {
      t("@if $"),
      i(1, "name"),
      t({ " {", "\t" }),
      t("$-"),
      util.mirror_node(1),
      t(": $"),
      util.mirror_node(1),
      t({ " !global;", "" }),
      t({ "}", "" }),
      i(0),
    }, line_begin),
  }
end

local utils = function()
  return {
    s({
      trig = "sa",
      name = "set arg",
    }, {
      t("$"),
      i(1, "name"),
      t(": "),
      i(2, "null"),
    }),

    s({
      trig = "if",
      name = "@if $condition",
    }, {
      t("@if "),
      i(1, "$condition"),
      t({ " {", "\t" }),
      i(0),
      t({ "", "}" }),
    }, line_begin),

    s({
      trig = "if",
      name = "if(sass($condition): $then; else: $that)",
    }, {
      t("if(sass("),
      i(1, "condition"),
      t("): "),
      i(2, "then"),
      t("; else: "),
      i(3, "that"),
      t(")"),
    }),

    s({
      trig = "ft",
      name = "for through",
      desc = "@for $i from $start through $end",
    }, {
      t("@for $"),
      i(1, "i"),
      t(" from "),
      i(2, "$start"),
      t(" through "),
      i(3, "$end"),
      t({ " {", "\t" }),
      i(0),
      t({ "", "}" }),
    }, line_begin),
  }
end

--- @private
--- @class vim-react-snippets.SassBuiltInOptions
--- @field name string
--- @field trig string
--- @field second_arg boolean
--- @field third_arg boolean?

--- @param opts vim-react-snippets.SassBuiltInOptions
local built_in = function(opts)
  local name = opts.name
  local trig = opts.trig
  local second_arg = opts.second_arg
  local third_arg = opts.third_arg
  local middle = {}
  if second_arg then
    table.insert(middle, t(", "))
    table.insert(middle, i(2, "$value"))
  end
  if third_arg then
    table.insert(middle, t(", "))
    table.insert(middle, i(3, "$value"))
  end

  return s(
    {
      trig = trig,
      desc = name,
    },
    util.merge_lists({
      t(name .. "($"),
      i(1, "name"),
    }, middle, { t(")") })
  )
end

local map_module = function()
  return {
    built_in({
      name = "map.get",
      trig = "mg",
      second_arg = true,
    }),
    built_in({
      name = "map.get",
      trig = "map.g",
      second_arg = true,
    }),
    built_in({
      name = "map.set",
      trig = "ms",
      second_arg = true,
    }),
    built_in({
      name = "map.set",
      trig = "map.s",
      second_arg = true,
    }),
    built_in({
      name = "map.remove",
      trig = "mr",
      second_arg = true,
    }),
    built_in({
      name = "map.remove",
      trig = "map.r",
      second_arg = true,
    }),
    built_in({
      name = "map.merge",
      trig = "mm",
      second_arg = true,
    }),
    built_in({
      name = "map.merge",
      trig = "map.m",
      second_arg = true,
    }),
    built_in({
      name = "map.deep-merge",
      trig = "mdm",
      second_arg = true,
    }),
    built_in({
      name = "map.deep-merge",
      trig = "map.d",
      second_arg = true,
    }),

    s({
      trig = "em",
      name = "each map",
      desc = "@each $key, $value in $map",
    }, {
      t("@each $"),
      i(1, "key"),
      t(", $"),
      i(2, "value"),
      t(" in $"),
      i(3, "map"),
      t({ " {", "\t" }),
      i(0),
      t({ "", "}" }),
    }, line_begin),
  }
end

local list_module = function()
  return {
    built_in({
      name = "list.append",
      trig = "la",
      second_arg = true,
    }),
    built_in({
      name = "list.append",
      trig = "list.a",
      second_arg = true,
    }),
    built_in({
      name = "list.index",
      trig = "li",
      second_arg = false,
    }),
    built_in({
      name = "list.index",
      trig = "list.i",
      second_arg = false,
    }),
    built_in({
      name = "list.length",
      trig = "ll",
      second_arg = false,
    }),
    built_in({
      name = "list.length",
      trig = "list.l",
      second_arg = false,
    }),
    built_in({
      name = "list.nth",
      trig = "ln",
      second_arg = true,
    }),
    built_in({
      name = "list.nth",
      trig = "list.n",
      second_arg = true,
    }),

    s({
      trig = "el",
      name = "each list",
      desc = "@each $value in $list",
    }, {
      t("@each $"),
      i(1, "value"),
      t(" in $"),
      i(2, "list"),
      t({ " {", "\t" }),
      i(0),
      t({ "", "}" }),
    }, line_begin),
  }
end

local string_module = function()
  return {
    built_in({
      name = "string.index",
      trig = "si",
      second_arg = true,
    }),
    built_in({
      name = "string.index",
      trig = "string.i",
      second_arg = true,
    }),
    built_in({
      name = "string.length",
      trig = "sl",
      second_arg = false,
    }),
    built_in({
      name = "string.length",
      trig = "string.l",
      second_arg = false,
    }),
    built_in({
      name = "string.slice",
      trig = "ss",
      second_arg = true,
      third_arg = true,
    }),
    built_in({
      name = "string.slice",
      trig = "string.s",
      second_arg = true,
      third_arg = true,
    }),
    s({
      name = "string.unquote",
      trig = "su",
    }, {
      t("string.unquote("),
      i(1),
      t(")"),
    }),
    s({
      trig = "string.u",
      name = "string.unquote",
    }, {
      t("string.unquote("),
      i(1),
      t(")"),
    }),
  }
end

local meta_module = function()
  return {
    built_in({
      name = "meta.type-of",
      trig = "to",
      second_arg = false,
    }),
    built_in({
      name = "meta.type-of",
      trig = "meta.t",
      second_arg = false,
    }),
  }
end

return util.merge_lists(
  use_modules(),
  at_rules(),
  libraries(),
  utils(),
  map_module(),
  list_module(),
  meta_module(),
  string_module()
)
