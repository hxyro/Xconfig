vim.cmd [[
try
  colorscheme doom-one
catch /^Vim\%((\a\+)\)\=:E185/
    try
        colorscheme onedark
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme default
        set background=dark
    endtry
endtry
]]

