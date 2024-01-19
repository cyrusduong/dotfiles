-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd("set title")
vim.cmd("set titlelen=128")

-- match highlight trailing spaces
vim.cmd("match errorMsg /\\s\\+$/")

-- * and # visual mode selections for blocks ignoring whitespace
-- https://vim.fandom.com/wiki/Search_for_visually_selected_text
vim.cmd([[
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
]])

vim.o.colorcolumn = "80,100" --"80,100,120"
