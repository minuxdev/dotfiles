local _, comment = pcall(require, "Comment")

if not _ then
	return
end

comment.setup({
	padding = true,
	sticky = true,
	ignore = nil,
	toggler = {
		line = "gcc",
		block = "gbd",
	},
	opleader = {
		line = "gc",
		block = "gb",
	},
	extra = {
		above = "gcO",
		bellow = "gco",
		eol = "gcA",
	},
	mappings = {
		basic = true,
		extra = true,
	},
})
