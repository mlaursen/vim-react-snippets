local util = require("vim-react-snippets.util")

local ls = require("luasnip")

local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node

--- @param typescript boolean
--- @return unknown[]
local use_app_selector = function(typescript)
  if not typescript then
    return {}
  end

  return util.const_snippet({
    config = {
      trig = "useAS",
      name = "useAppSelector",
    },
    const_name = "value",
    create_snippet = function(start)
      return {
        t("useAppSelector("),
        sn(start, {
          i(1, "state"),
          t(" => "),
          i(2),
        }),
        t(")"),
      }
    end,
  })
end

--- @param typescript boolean
--- @return unknown[]
local redux = function(typescript)
  return util.merge_lists(
    util.const_snippet({
      config = {
        trig = "useD",
        name = "useDispatch",
      },
      const_name = "dispatch",
      create_snippet = function()
        return {
          t("use" .. (typescript and "App" or "") .. "Dispatch()"),
        }
      end,
    }),

    use_app_selector(typescript),

    util.const_snippet({
      config = {
        trig = "useSL",
        name = "useSelector",
      },
      const_name = "value",
      const_edit = 1,
      create_snippet = function(start)
        local add = 0
        local typedef = {}
        if typescript then
          add = add + 1
          table.insert(typedef, t(": "))
          table.insert(typedef, sn(start, { i(1, "AppState") }))
        end

        return util.merge_lists(
          {
            t("useSelector((state"),
          },
          typedef,
          {
            t(") => "),
            i(start + add, ""),
            t(")"),
          }
        )
      end,
    })
  )
end

return redux
