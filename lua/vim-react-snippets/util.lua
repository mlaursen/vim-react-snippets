return {
  --- @param language string
  --- @param snippets table<string, unknown>
  --- @return table<string, unknown>
  extend_language = function(language, snippets)
    local combined_snippets = require("vim-react-snippets.luasnippets." .. language)
    for key, value in pairs(snippets) do
      combined_snippets[key] = value
    end

    return combined_snippets
  end,

  --- @return string
  current_filename = function()
    return vim.api.nvim_buf_get_name(0)
  end,
}
