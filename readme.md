# scratch.nvim
scratch.nvim is a plugin for evaluating interpretable code inside `scratch` buffer

## supported languages
- lua
- python
- javascript (node)
- typescript (tsnode)

## usage
- `:ScratchNew <filetype>` - create new `scratch` buffer
- `:ScratchEval` - eval current `scratch` buffer

## telescope picker

before using picker, load `scratch.nvim` telescope extenstion
```lua
require("telescope").load_extension("scratch")
```
after that, you can do `:Telescope scratch` and create scratch buffer with specified filetype

to change filetype you can call `:Telescope scratch ft` and pick new filetype
