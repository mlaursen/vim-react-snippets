local util = require("vim-react-snippets.util")
local config = require("vim-react-snippets.config")

local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

--- @param esm boolean
--- @param globals boolean
local react_test_file = function(esm, globals)
  local rtl_index = (globals and 2) or 1
  local filename_index = rtl_index + 1
  local globals_import = globals
      and {
        t('import { describe, expect, it } from "'),
        i(1, config.test_framework),
        t({ '"', "" }),
      }
    or {}

  return s(
    {
      trig = (globals and "g" or "r") .. "tf" .. (esm and "e" or ""),
      name = (globals and "Globals" or "React") .. "Test File" .. (esm and " (ESM)" or ""),
      desc = "Base react testing setup with react-testing-library"
        .. (globals and " and jest globals" or "")
        .. (esm and " and esm imports" or ""),
    },
    util.merge_lists(globals_import, {
      t('import { render, screen, userEvent } from "'),
      i(rtl_index, config.test_renderer_path),
      t({ '"', "" }),
      t("import { "),
      util.current_filename(filename_index),
      t(' } from "../'),
      util.mirror_node(filename_index),
      t(esm and ".js" or ""),
      t({ '"', "", "" }),

      t('describe("'),
      util.mirror_node(filename_index),
      t({ '", () => {', '\tit("should ' }),
      i(filename_index + 1),
      t({ '", () => {', "\t\t" }),
      i(filename_index + 2),
      t({ "", "\t})", "})" }),
    })
  )
end

--- @param typescript boolean
--- @return unknown[]
local react_testing = function(typescript)
  return {
    react_test_file(false, false),
    react_test_file(false, true),
    react_test_file(true, false),
    react_test_file(true, true),

    s({
      trig = "uet",
      name = "User Event Test",
    }, {
      t('it("should '),
      i(1),
      t({ '", async () => {', "\t" }),
      t({ "const user = userEvent.setup()", "\t" }),
      i(2),
      t({ "", "\texpect(true).toBe(true)" }),
      t({ "", "})" }),
    }),
  }
end

return react_testing