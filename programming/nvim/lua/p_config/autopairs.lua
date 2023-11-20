local sn, ap = pcall(require, 'nvim-autopairs')
local sc, cmp = pcall(require, 'cmp')


if not sn and sc then return end

local apc = require('nvim-autopairs.completion.cmp')

ap.setup({
  check_ts = true,
})

cmp.event:on('confirm_done', apc.on_confirm_done({ map_char = { tex = '' } }))
