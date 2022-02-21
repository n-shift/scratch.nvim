local eval = {}

function eval.lua(lines)
    local chunk = table.concat(lines, '\n')
    loadstring(chunk)()
end

return eval
