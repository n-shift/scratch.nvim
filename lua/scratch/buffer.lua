local buffer = {}

function buffer.create(filetype)
    buffer.bufnr = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_name(buffer.bufnr, "scratch.nvim")
    vim.api.nvim_buf_set_option(buffer.bufnr, "filetype", filetype)
    vim.api.nvim_win_set_buf(0, buffer.bufnr)
end

function buffer.eval()
    local lines = vim.api.nvim_buf_get_lines(buffer.bufnr, 0, -1, true)
    local filetype = vim.api.nvim_buf_get_option(buffer.bufnr, "filetype")
    require("scratch.eval")[filetype](lines)
end

return buffer
