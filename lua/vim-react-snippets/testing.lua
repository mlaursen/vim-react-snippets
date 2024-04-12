local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local testing = function()
  return {
    s({
      trig = "desc",
      name = "Describe",
      desc = "Describe a test",
    }, {
      t('describe("'),
      i(1),
      t({ '", () => {', '\tit("should ' }),
      i(2),
      t({ '", () => {', "\t\t" }),
      i(3),
      t({ "", "\t})", "})" }),
    }),
    s({
      trig = "it",
      name = "it",
      desc = 'it("should ...")',
    }, {
      t('it("should '),
      i(1),
      t({ '", () => {', "\t" }),
      i(0),
      t({ "", "})" }),
    }),
    s({
      trig = "ita",
      name = "it (async)",
      desc = 'it("should ...", async () => { ... })',
    }, {
      t('it("should '),
      i(1),
      t({ '", async () => {', "\t" }),
      i(0),
      t({ "", "})" }),
    }),
    s({
      trig = "es",
      name = "Expect Snapshot",
      desc = "",
    }, {
      t("expect("),
      i(1, "container"),
      t(").toMatchSnapshot()"),
    }),

    s({
      trig = "wf",
      name = "wait for",
    }, {
      t({ "await waitFor(() => {", "\t" }),
      i(0),
      t({ "", "})" }),
    }),

    s({
      trig = "ett",
      name = "expect to throw",
    }, {
      t("expect(() =>"),
      i(1),
      t(").toThrow()"),
    }),
    s({
      trig = "entt",
      name = "expect not to throw",
    }, {
      t("expect(() =>"),
      i(1),
      t(").not.toThrow()"),
    }),

    s({
      trig = "enc",
      name = "expect not called",
      desc = "expect not toHaveBeenCalled",
    }, {
      t("expect("),
      i(1),
      t(").not.toHaveBeenCalled()"),
    }),
    s({
      trig = "ecw",
      name = "expect called with",
      desc = "expect toHaveBeenCalledWith",
    }, {
      t("expect("),
      i(1),
      t(").toHaveBeenCalledWith("),
      i(2),
      t(")"),
    }),
    s({
      trig = "encw",
      name = "expect not called with",
      desc = "expect not toHaveBeenCalledWith",
    }, {
      t("expect("),
      i(1),
      t(").not.toHaveBeenCalledWith("),
      i(2),
      t(")"),
    }),
  }
end

return testing
