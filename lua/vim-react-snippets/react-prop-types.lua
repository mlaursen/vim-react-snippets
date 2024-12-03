local util = require("vim-react-snippets.util")

local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node

local prop_type = function(opts)
  local key = opts.key
  local type = opts.type
  local required = opts.required

  local defn = {
    t("PropTypes." .. type),
  }
  if opts.call then
    table.insert(defn, t("("))
    local call = opts.call()
    for _, v in ipairs(call) do
      table.insert(defn, v)
    end
    table.insert(defn, t(")"))
  end

  local key_suffix = ""
  local type_suffix = ""
  if required then
    key_suffix = "r"
    type_suffix = ".isRequired"
    table.insert(defn, t(".isRequired"))
  end

  return s({
    trig = "pt." .. key .. key_suffix,
    desc = "PropTypes." .. type .. type_suffix,
  }, defn)
end

local prop_types = function(opts)
  return {
    prop_type({
      key = opts.key,
      call = opts.call,
      type = opts.type,
    }),
    prop_type({
      key = opts.key,
      call = opts.call,
      type = opts.type,
      required = true,
    }),
  }
end

--- @param typescript boolean
local react_prop_types = function(typescript)
  local extra = {}
  if not typescript then
    table.insert(
      extra,
      s({
        trig = "cpt",
        desc = "component prop types",
      }, {
        util.current_filename(1),
        t({ ".propTypes = {", "" }),
        t({ "\t" }),
        sn(2, {
          i(1, "className"),
        }),
        t(": "),
        sn(3, {
          i(1, "PropTypes.string"),
        }),
        i(0),
        t({ "", "" }),
        t("}"),
      })
    )
  end

  return util.merge_lists(
    prop_types({
      key = "a",
      type = "array",
    }),
    prop_types({
      key = "b",
      type = "bool",
    }),
    prop_types({
      key = "f",
      type = "func",
    }),
    prop_types({
      key = "nu",
      type = "number",
    }),
    prop_types({
      key = "o",
      type = "object",
    }),
    prop_types({
      key = "s",
      type = "string",
    }),
    prop_types({
      key = "no",
      type = "node",
    }),
    prop_types({
      key = "e",
      type = "element",
    }),
    prop_types({
      key = "ao",
      type = "arrayOf",
      call = function()
        return { i(1, "PropTypes.string") }
      end,
    }),
    prop_types({
      key = "io",
      type = "instanceOf",
      call = function()
        return { i(1, "PropTypes.string") }
      end,
    }),
    prop_types({
      key = "oo",
      type = "objectOf",
      call = function()
        return { i(1, "PropTypes.string") }
      end,
    }),
    prop_types({
      key = "one",
      type = "oneOf",
      call = function()
        return {
          t("['"),
          i(1),
          t("'"),
          i(2),
          t("]"),
        }
      end,
    }),
    prop_types({
      key = "onet",
      type = "oneOfType",
      call = function()
        return {
          t({ "[" }, { "" }),
          i(1),
          t({ "]" }),
        }
      end,
    }),
    prop_types({
      key = "sh",
      type = "shape",
      call = function()
        return {
          t({ "{", "" }),
          t({ "\t" }),
          i(1),
          t({ "", "}" }),
        }
      end,
    }),
    extra
  )
end

return react_prop_types
