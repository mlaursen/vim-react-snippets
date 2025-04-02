local util = require("vim-react-snippets.util")
local config = require("vim-react-snippets.config")

local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

--- @private
--- @class vim-react-snippets.FunctionComponentOptions
--- @field props boolean
--- @field export boolean | "default"
--- @field server boolean
--- @field forward boolean
--- @field typescript boolean

--- @param opts vim-react-snippets.FunctionComponentOptions
local react_imports = function(opts)
  if not opts.export then
    return {}
  end

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

--- @param opts vim-react-snippets.FunctionComponentOptions
local component_props = function(opts)
  if not opts.typescript or (not opts.props and not opts.forward) then
    return {}
  end

  local export = opts.export ~= false

  return {
    t((export and "export " or "") .. "interface "),
    util.mirror_node(1),
    t({ "Props {", "\t" }),
    i(2),
    t({ "", "\tchildren: ReactNode", "}", "", "" }),
  }
end

--- @param opts vim-react-snippets.FunctionComponentOptions
--- @return unknown[]
local component_func = function(opts)
  local props = opts.props
  local server = opts.server
  local forward = opts.forward
  local typescript = opts.typescript

  --- @type unknown[]
  local parts = {}
  if server then
    table.insert(parts, t("async "))
  end
  table.insert(parts, t("function "))
  table.insert(parts, util.current_filename(1))
  table.insert(parts, t("("))

  if forward then
    table.insert(parts, t("props, ref) {"))
  elseif typescript then
    if props then
      table.insert(parts, t("props: " .. (config.readonly_props and "Readony<" or "")))
      table.insert(parts, util.mirror_node(1))
      table.insert(parts, t("Props" .. (config.readonly_props and ">" or "")))
    end
    table.insert(parts, t("): " .. (server and "Promise<" or "") .. "ReactElement" .. (server and ">" or "") .. " {"))
  elseif props then
    table.insert(parts, t("props) {"))
  else
    table.insert(parts, t(") {"))
  end
  table.insert(parts, t({ "", "" }))

  return parts
end

--- @param opts vim-react-snippets.FunctionComponentOptions
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

--- @param opts vim-react-snippets.FunctionComponentOptions
local component_export_line = function(opts)
  local export = opts.export ~= false
  local default = opts.export == "default"
  local forward = opts.forward
  local maybe_const = (not default and forward and {
    t("const "),
    util.mirror_node(1),
    t(" = "),
  }) or {}

  return util.merge_lists({
    t((export and "export " or "") .. (default and "default " or "")),
  }, maybe_const, forward_ref(opts), component_func(opts))
end

--- @param opts vim-react-snippets.FunctionComponentOptions
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

--- @param opts vim-react-snippets.FunctionComponentOptions
local function_component = function(opts)
  local props = opts.props
  local export = opts.export ~= false
  local default = opts.export == "default"
  local forward = opts.forward

  local simple = not props and not forward
  local trig = (simple and "s" or "")
    .. (forward and "f" or "")
    .. "fc"
    .. (default and "d" or "")
    .. (export and "e" or "")

  local desc = (simple and "Simple " or "")
    .. (forward and "Forwarded" or "")
    .. "Function Component "
    .. (default and "Default " or "")
    .. (export and "Export" or "")
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

local server_component = function(opts)
  local props = opts.props
  local export = opts.export
  local default = export == "default"
  local simple = not props

  --- @type vim-react-snippets.FunctionComponentOptions
  local shared_opts = {
    props = props,
    export = export,
    server = true,
    forward = false,
    typescript = true,
  }
  local trig = (simple and "s" or "") .. "sc" .. (default and "d" or "") .. (export and "e" or "")
  local desc = (simple and "Simple " or "")
    .. "Server Component "
    .. (default and "Default " or "")
    .. (export and "Export" or "")
  return s(
    {
      trig = trig,
      desc = desc,
    },
    util.merge_lists(
      react_imports(shared_opts),
      component_props(shared_opts),
      component_export_line(shared_opts),
      component_body(shared_opts),
      { t("}") }
    )
  )
end

--- @param typescript boolean
local function_components = function(typescript)
  return {
    -- fc
    function_component({
      props = true,
      export = false,
      server = false,
      forward = false,
      typescript = typescript,
    }),
    -- fce
    function_component({
      props = true,
      export = true,
      server = false,
      forward = false,
      typescript = typescript,
    }),
    -- fcde
    function_component({
      props = true,
      export = "default",
      server = false,
      forward = false,
      typescript = typescript,
    }),

    -- sfc
    function_component({
      props = false,
      export = false,
      server = false,
      forward = false,
      typescript = typescript,
    }),
    -- sfce
    function_component({
      props = false,
      export = true,
      server = false,
      forward = false,
      typescript = typescript,
    }),
    -- sfcde
    function_component({
      props = false,
      export = "default",
      server = false,
      forward = false,
      typescript = typescript,
    }),

    -- ffc
    function_component({
      props = true,
      export = false,
      server = false,
      forward = true,
      typescript = typescript,
    }),
    -- ffce
    function_component({
      props = true,
      export = true,
      server = false,
      forward = true,
      typescript = typescript,
    }),
    -- ffcde
    function_component({
      props = true,
      export = "default",
      server = false,
      forward = true,
      typescript = typescript,
    }),
  }
end

local server_components = function(typescript)
  if not typescript then
    return {}
  end

  return {
    -- scde
    server_component({
      props = true,
      export = "default",
    }),
    -- sscde
    server_component({
      props = false,
      export = "default",
    }),

    -- sce
    server_component({
      props = true,
      export = true,
    }),
    -- ssce
    server_component({
      props = false,
      export = true,
    }),
  }
end

--- @private
--- @param typescript boolean
local react_components = function(typescript)
  return util.merge_lists(function_components(typescript), server_components(typescript))
end

return react_components