local util = require("vim-react-snippets.util")

local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

--- @private
--- @class FunctionComponentOptions
--- @field props boolean
--- @field default boolean
--- @field forward boolean
--- @field typescript boolean

--- @param opts FunctionComponentOptions
local react_imports = function(opts)
  local parts = {}
  if opts.forward then
    table.insert(parts, "forwardRef")
  elseif opts.typescript then
    table.insert(parts, "type ReactElement")
  end

  if opts.props and opts.typescript then
    table.insert(parts, "type ReactNode")
  end

  local joined = table.concat(parts, ", ")
  if #joined < 1 then
    return {}
  end

  return {
    t({ "import { " .. joined .. ' } from "react"', "", "" }),
  }
end

--- @param opts FunctionComponentOptions
local component_props = function(opts)
  if not opts.typescript or (not opts.props and not opts.forward) then
    return {}
  end

  return {
    t("export interface "),
    util.mirror_node(1),
    t({ "Props {", "\t" }),
    i(2),
    t({ "", "\tchildren: ReactNode", "}", "", "" }),
  }
end

--- @param opts FunctionComponentOptions
--- @return unknown[]
local component_func = function(opts)
  local props = opts.props
  local forward = opts.forward
  local typescript = opts.typescript

  --- @type unknown[]
  local parts = {
    t("function "),
    util.current_filename(1),
    t("("),
  }
  if forward then
    table.insert(parts, t("props, ref) {"))
  elseif typescript then
    if props then
      table.insert(parts, t("props: "))
      table.insert(parts, util.mirror_node(1))
      table.insert(parts, t("Props"))
    end
    table.insert(parts, t("): ReactElement {"))
  elseif props then
    table.insert(parts, t("props) {"))
  else
    table.insert(parts, t(") {"))
  end
  table.insert(parts, t({ "", "" }))

  return parts
end

--- @param opts FunctionComponentOptions
local forward_ref = function(opts)
  if not opts.forward then
    return {}
  end

  local types = {}
  if opts.typescript then
    table.insert(types, t("<HTML"))
    table.insert(types, i(2, "Div"))
    table.insert(types, t("Element, "))
    table.insert(types, util.mirror_node(1))
    table.insert(types, t("Props>"))
  end

  return util.merge_lists({ t("forwardRef") }, types, { t("(") })
end

--- @param opts FunctionComponentOptions
local component_export_line = function(opts)
  local default = opts.default
  local forward = opts.forward
  local maybe_const = (not default and forward and {
    t("const "),
    util.mirror_node(1),
    t(" = "),
  }) or {}

  return util.merge_lists({
    t("export " .. (default and "default " or "")),
  }, maybe_const, forward_ref(opts), component_func(opts))
end

--- @param opts FunctionComponentOptions
local component_body = function(opts)
  if opts.forward then
    return {
      t({ "\treturn (", "" }),
      t({ "\t\t<div ref={ref}>", "" }),
      i(0),
      t({ "\t\t</div>", "" }),
      t({ "\t)", "" }),
    }
  end

  return {
    i(0),
    t({ "\treturn <></>", "" }),
  }
end

--- @param opts FunctionComponentOptions
local function_component = function(opts)
  local props = opts.props
  local default = opts.default
  local forward = opts.forward

  local simple = not props and not forward
  local trig = (simple and "s" or "") .. (forward and "f" or "") .. "fc" .. (default and "d" or "") .. "e"

  local desc = (simple and "Simple " or "")
    .. (forward and "Forwarded" or "")
    .. "Function Component "
    .. (default and "Default " or "")
    .. "Export"
  return s(
    {
      trig = trig,
      desc = desc,
    },
    util.merge_lists(react_imports(opts), component_props(opts), component_export_line(opts), component_body(opts), {
      t("}" .. (opts.forward and ")" or "")),
    })
  )
end

--- @private
--- @param typescript boolean
local react_components = function(typescript)
  return {
    -- fce
    function_component({
      props = false,
      default = true,
      forward = false,
      typescript = typescript,
    }),
    function_component({
      props = true,
      default = true,
      forward = false,
      typescript = typescript,
    }),

    -- sfce
    function_component({
      props = false,
      default = false,
      forward = false,
      typescript = typescript,
    }),
    function_component({
      props = true,
      default = false,
      forward = false,
      typescript = typescript,
    }),

    -- ffce
    function_component({
      props = true,
      default = false,
      forward = true,
      typescript = typescript,
    }),
    function_component({
      props = true,
      default = true,
      forward = true,
      typescript = typescript,
    }),
  }
end

return react_components
