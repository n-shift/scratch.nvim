local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local config = require("telescope.config").values
local actions = require("telescope.actions")
local state = require("telescope.actions.state")

local filetypes = {}
for filetype, _ in pairs(require("scratch.eval")) do
    table.insert(filetypes, filetype)
end
table.sort(filetypes)

local picker = function(opts)
    opts = opts or {}
    pickers.new(opts, {
        prompt_title = "scratch.nvim",
        finder = finders.new_table({
            results = filetypes
        }),
        sorter = config.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = state.get_selected_entry()
                require("scratch.buffer").create(selection[1])
            end)
            return true
        end
    }):find()
end

local ft = function(opts)
    opts = opts or {}
    pickers.new(opts, {
        prompt_title = "scratch.nvim filetype",
        finder = finders.new_table({
            results = filetypes
        }),
        sorter = config.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = state.get_selected_entry()
                local bufnr = require("scratch.buffer").bufnr
                vim.api.nvim_buf_set_option(bufnr, "filetype", selection[1])
            end)
            return true
        end
    }):find()
end

return require("telescope").register_extension({
    exports = {
        scratch = picker,
        ft = ft,
    }
})
