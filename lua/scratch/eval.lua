local eval = {}

function eval.lua(lines)
    local chunk = table.concat(lines)
    loadstring(chunk)()
end

return eval
