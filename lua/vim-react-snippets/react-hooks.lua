local util = require("vim-react-snippets.util")

local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local d = ls.dynamic_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

--- @param typescript boolean
--- @return unknown[]
local use_state = function(typescript)
  return {
    s(
      {
        trig = "useS",
        name = "useState",
      },
      util.merge_lists(
        {
          t("const ["),
          i(1),
          t(", set"),
          f(function(args)
            return util.upper_first(args[1][1]:gsub("^is", ""))
          end, { 1 }),
          t("] = useState"),
        },
        util.typescript_tabstop(3, typescript),
        {
          t("("),
          i(2),
          t(")"),
        }
      )
    ),
  }
end

--- @param typescript boolean
--- @return unknown[]
local use_reducer = function(typescript)
  local state = { t("state") }
  local action = { t("action") }
  local return_type = {}
  local start = 3
  if typescript then
    start = 5
    table.insert(state, t(": "))
    table.insert(state, i(3, "State"))
    table.insert(action, t(": "))
    table.insert(action, i(4, "Action"))
    table.insert(return_type, t(": "))
    table.insert(return_type, util.mirror_node(3))
  end

  return {
    s(
      {
        trig = "useRed",
        name = "useReducer",
      },
      util.merge_lists(
        {
          t("const ["),
          i(1, "state"),
          t(", "),
          i(2, "dispatch"),
          t("] = useReducer(function reducer("),
        },
        state,
        { t(", ") },
        action,
        { t(")") },
        return_type,
        {
          t({
            " {",
            "\tswitch (action.type) {",
            "\t\tdefault:",
            "\t\t\treturn state",
            "\t}",
            "",
          }),
          t("}, "),
          i(start, "initialState"),
          t(")"),
        }
      )
    ),
  }
end

--- @param typescript boolean
--- @return unknown[]
local create_context_provider = function(typescript)
  local start = 1
  local interface = {}
  local context_typedef = {}
  if typescript then
    start = start + 2
    table.insert(interface, t({ "", "export interface " }))
    table.insert(
      interface,
      d(1, function()
        return sn(nil, {
          -- current filename without use prefix and Context suffix
          i(1, util.upper_first(vim.fn.expand("%:t:r"):gsub("^use", ""):gsub("Context$", ""))),
          i(2, "Context"),
        })
      end)
    )
    table.insert(interface, t({ " {", "", "}", "", "" }))

    table.insert(context_typedef, t("<"))
    table.insert(context_typedef, util.mirror_node(1))
    table.insert(context_typedef, i(2, " | null"))
    table.insert(context_typedef, t(">"))
  end

  return {
    s(
      {
        trig = "ccp",
        name = "Create Context Provider",
      },
      util.merge_lists(
        {
          t({ 'import { createContext, useContext } from "react"', "", "" }),
        },
        interface,
        {
          t("const context = createContext"),
        },
        context_typedef,
        {
          t("("),
          i(start, "null"),
          t(")"),
          t({ "", "const { Provider } = context", "", "" }),
          t("export function use"),
        },
        util.typescript_mirror_node(1, typescript),
        {
          t("()"),
          t(typescript and ": " or ""),
        },
        util.typescript_mirror_node(1, typescript),
        {
          t(typescript and " " or ""),
          t({
            "{",
            "\tconst value = useContext(context)",
            "\tif (!value) {",
            "\t\t",
          }),
          t('throw new Error("'),
          util.mirror_node(1),
          t(' must be initialized.")'),
          t({
            "",
            "\t}",
            "",
            "\treturn value",
            "}",
          }),
        }
      )
    ),
  }
end

--- @param typescript boolean
local react_hooks = function(typescript)
  return util.merge_lists(
    {
      s({
        trig = "useE",
        name = "useEffect",
      }, {
        t({ "useEffect(() => {", "\t" }),
        i(0),
        t({ "", "}, [])" }),
      }),
    },

    use_state(typescript),
    use_reducer(typescript),

    util.const_snippet({
      config = {
        trig = "useR",
        name = "useRef",
      },
      const_name = "ref",
      const_edit = 1,
      create_snippet = function(start)
        return util.merge_lists(
          {
            t("useRef"),
          },
          util.typescript_tabstop(start + 1, typescript),
          {
            t("("),
            i(start, "null"),
            t(")"),
          }
        )
      end,
    }),

    util.const_snippet({
      config = {
        trig = "useC",
        name = "useContext",
      },
      const_name = "context",
      const_edit = 1,
      create_snippet = function(start)
        return {
          t("useContext("),
          i(start),
          t(")"),
        }
      end,
    }),

    util.const_snippet({
      config = {
        trig = "useCB",
        name = "useCallback",
      },
      const_name = "callback",
      const_edit = 1,
      create_snippet = function(start)
        return {
          t("useCallback(("),
          i(start),
          t({ ") => {", "\t" }),
          i(start + 1),
          t({ "", "}, [])" }),
        }
      end,
    }),
    util.const_snippet({
      config = {
        trig = "useM",
        name = "useMemo",
      },
      const_name = "memoized",
      const_edit = 1,
      create_snippet = function(start)
        return {
          t({ "useMemo(() => ({", "\t" }),
          i(start),
          t({ "", "}), [])" }),
        }
      end,
    }),
    util.const_snippet({
      config = {
        trig = "useMR",
        name = "useMemo Return",
      },
      const_name = "memoized",
      const_edit = 1,
      create_snippet = function(start)
        return {
          t({ "useMemo(() => {", "\t" }),
          i(start),
          t({ "", "}, [])" }),
        }
      end,
    }),
    create_context_provider(typescript)
  )
end

return react_hooks
