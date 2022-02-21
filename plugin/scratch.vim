function ScratchCompletion(A, L, P)
    return luaeval("require('scratch').complete(_A)", a:L)
endfunction

command -bang -nargs=1 -complete=custom,ScratchCompletion ScratchNew :lua require("scratch.buffer").create("<args>")
command -bang -nargs=0 ScratchEval :lua require("scratch.buffer").eval()
