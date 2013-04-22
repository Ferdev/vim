let g:vimux_ruby_cmd_all_tests = "zeus parallel_rspec"
map tf :RunRubyFocusedTest<CR>
map tc :RunRubyFocusedContext<CR>
map ta :RunAllRubyTests<CR>
map tl :RunLastVimTmuxCommand<CR>
map th :CloseVimTmuxPanes<CR>
