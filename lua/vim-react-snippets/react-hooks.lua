local util = require("vim-react-snippets.util")

local ls = require("luasnip")
local conds = require("luasnip.extras.expand_conditions")

local s = ls.snippet
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
local use_ref = function(typescript)
  return {
    s(
      {
        trig = "useR",
        name = "useRef",
      },
      util.merge_lists(
        {
          t("const "),
          i(1, "ref"),
          t(" = useRef"),
        },
        util.typescript_tabstop(3, typescript),
        {
          t("("),
          i(2, "null"),
          t("("),
        }
      ),
      {
        condition = conds.line_begin,
      }
    ),
    s(
      {
        trig = "useR",
        name = "useRef",
      },
      util.merge_lists(
        {
          t("useRef"),
        },
        util.typescript_tabstop(2, typescript),
        {
          t("("),
          i(1, "null"),
          t("("),
        }
      ),
      {
        condition = conds.line_end,
      }
    ),
  }
end

--- @param typescript boolean
local react_hooks = function(typescript)
  return util.merge_lists(use_ref(typescript), use_state(typescript), {
    s({
      trig = "useE",
      name = "useEffect",
    }, {
      t({ "useEffect(() => {", "\t" }),
      i(0),
      t({ "", "}, [])" }),
    }),

    s({
      trig = "useCB",
      name = "useCallback",
    }, {
      t("const "),
      i(1, "callback"),
      t(" = useCallback(("),
      i(2),
      t({ ") => {", "\t" }),
      i(0),
      t({ "", "}, [])" }),
    }, {
      condition = conds.line_begin,
    }),
    s({
      trig = "useCB",
      name = "useCallback",
    }, {
      t("useCallback(("),
      i(1),
      t({ ") => {", "\t" }),
      i(0),
      t({ "", "}, [])" }),
    }, {
      condition = conds.line_end,
    }),

    s({
      trig = "useM",
      name = "useMemo",
    }, {
      t("const "),
      i(1, "memoized"),
      t({ " = useMemo(() => ({", "\t" }),
      i(0),
      t({ "", "}), [])" }),
    }, {
      condition = conds.line_begin,
    }),
    s({
      trig = "useM",
      name = "useMemo",
    }, {
      t({ "useMemo(() => ({", "\t" }),
      i(0),
      t({ "", "}), [])" }),
    }, {
      condition = conds.line_end,
    }),
    s({
      trig = "useMR",
      name = "useMemo Return",
    }, {
      t("const "),
      i(1, "memoized"),
      t({ " = useMemo(() => {", "\t" }),
      i(0),
      t({ "", "}, [])" }),
    }, {
      condition = conds.line_begin,
    }),
    s({
      trig = "useMR",
      name = "useMemo",
    }, {
      t({ "useMemo(() => {", "\t" }),
      i(0),
      t({ "", "}, [])" }),
    }, {
      condition = conds.line_end,
    }),
  })
end

return react_hooks
