local util = require("vim-react-snippets.util")

local ls = require("luasnip")
local conds = require("luasnip.extras.expand_conditions")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

--- @param typescript boolean
--- @return unknown
local reduce = function(typescript)
  local result_index = 3
  --- @type unknown[]
  local result_type = {}
  if typescript then
    result_index = 4
    table.insert(result_type, t("<"))
    table.insert(result_type, i(3, "ResultType"))
    table.insert(result_type, t(">"))
  end

  local item_index = result_index + 1
  local body_index = item_index + 1
  local initial_index = body_index + 1

  return s(
    {
      trig = "reduce",
      name = "Reduce",
    },
    util.merge_lists(
      {
        t("const "),
        i(1, "value"),
        t(" = "),
        i(2, "list"),
        t(".reduce"),
      },
      result_type,
      {
        t("(("),
        i(result_index, "result"),
        t(", "),
        i(item_index, "item"),
        t({ ") => {", "\t" }),
        i(body_index),
        t({ "", "\t return " }),
        util.mirror_node(item_index),
        t({ "", "}, " }),
        i(initial_index, "initial"),
        t(")"),
      }
    ),
    { condition = conds.line_begin }
  )
end

--- @param typescript boolean
local common = function(typescript)
  return {
    s({
      trig = "dev",
      name = "Development",
      desc = 'process.env.NODE_ENV !== "production"',
    }, {
      t('process.env.NODE_ENV !== "production"'),
    }),
    s({
      trig = "prod",
      name = "Production",
      desc = 'process.env.NODE_ENV === "production"',
    }, {
      t('process.env.NODE_ENV === "production"'),
    }),

    s({
      trig = "noop",
    }, {
      t("const noop = ()" .. (typescript and ": void" or "")),
      t({ " => {", "\t// do nothing", "}" }),
    }),

    s({
      trig = "dc",
      name = "Destructured Const",
    }, {
      t("const { "),
      i(2),
      t(" } = "),
      i(1, "props"),
    }, {
      condition = conds.line_begin,
    }),

    s({
      trig = "dc",
      name = "Destructured Const",
    }, {
      t("const { "),
      i(1),
      t(" } = "),
    }),

    s({
      trig = "edc",
      name = "Export Destructured Const",
    }, {
      t("export const { "),
      i(2),
      t(" } = "),
      i(1, "props"),
    }),

    s({
      trig = "if",
      desc = "if (condition) {}",
    }, {
      t("if ("),
      i(1, "condition"),
      t({ ") {", "\t" }),
      i(2),
      t({ "", "}" }),
      i(0),
    }, {
      condition = conds.line_end,
    }),

    s({
      trig = "if",
      desc = "if (condition) ",
    }, {
      t("if ("),
      i(0, "condition"),
      t(")"),
    }, {
      --- @param line_to_cursor string
      condition = function(line_to_cursor)
        return line_to_cursor:find("else%s*") ~= nil
      end,
    }),

    s({
      trig = "else",
      name = "Else",
      desc = "else {}",
    }, {
      t("else "),
      i(1),
      t({ "{", "\t" }),
      i(2),
      t({ "", "}" }),
      i(0),
    }),

    s({
      trig = "switch",
      name = "Switch Statement",
    }, {
      t("switch ("),
      i(1, "key"),
      t({ ") {", "\tcase " }),
      i(2, "value"),
      t({ ":", "\t\t" }),
      i(3),
      t({ "", "\t\tbreak", "\tdefault:", "\t\t" }),
      i(0),
      t({ "", "}", "" }),
    }),

    s({
      trig = "for",
      name = "for loop",
    }, {
      t("for (let "),
      i(1, "i"),
      t(" = "),
      i(2, "0"),
      t("; "),
      util.mirror_node(1),
      t(" < "),
      i(3, "list"),
      t(".length; "),
      util.mirror_node(1),
      t({ "++ {", "\tconst " }),
      i(4, "item"),
      t(" = "),
      util.mirror_node(3),
      t("["),
      util.mirror_node(1),
      t({ "]", "\t" }),
      i(0),
      t({ "", "}" }),
    }),

    reduce(typescript),
  }
end

return common
