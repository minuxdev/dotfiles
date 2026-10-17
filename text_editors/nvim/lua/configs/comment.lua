require('ts_context_commentstring').setup {
  enable_autocmd = false,
}

require('mini.comment').setup({
  options = {
    -- custom_commentstring = nil,
    custom_commentstring = function()
      return require('ts_context_commentstring.internal').calculate_commentstring()
          or vim.bo.commentstring
    end,
    ignore_blank_line = false,
    pad_comment_space = true,
  },
  mappings = {
    -- Toggle comment (in normal and visual mode)
    comment = 'gc',
    -- Toggle comment on current line
    comment_line = 'gcc',
    -- Toggle comment on visual selection
    comment_visual = 'gc',
    -- Define 'textobject' comment
    textobject = 'gc',
  },
})
