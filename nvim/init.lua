-- ============================================================================
-- FILE: ~/.config/nvim/init.lua
-- ============================================================================
-- Load vim options FIRST
require("vim-options")

-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Load all plugins from lua/plugins/ directory
-- Lazy will automatically load all .lua files in that folder
require("lazy").setup("plugins")

-- List of groups to force transparent
local transparent_groups = {
	"Normal",
	"NormalNC",
	"EndOfBuffer",
	"SignColumn",
	"LineNr",
	"FoldColumn",
}

-- Function to clear bg for all groups
local function make_transparent()
	for _, group in ipairs(transparent_groups) do
		vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
	end
end

-- Apply immediately (current colorscheme)
make_transparent()

-- Reapply every time a colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = make_transparent,
})

-- Added for supporessing image-clip notfiication (its a bug of image-clip)
vim.defer_fn(function()
  local suppress = function(msg) return msg and msg:lower():find("content is not an image") end

  for _, notify in ipairs({vim.notify, package.loaded["snacks.notifier"] and package.loaded["snacks.notifier"].notify}) do
    if type(notify) == "function" then
      local orig = notify
      local wrapper = function(msg, ...)
        if suppress(msg) then return end
        return orig(msg, ...)
      end
      if notify == vim.notify then
        vim.notify = wrapper
      else
        package.loaded["snacks.notifier"].notify = wrapper
      end
    end
  end
end, 1000)


