return {
    'dart-lang/dart-vim-plugin',
    dependencies = {
        'thosakwe/vim-flutter',
    },
    config = function()
        local g = vim.g

        g.flutter_split_height = 15
        g.flutter_autoscroll = 1
        g.flutter_close_on_quit = 1

        local keymap = vim.keymap

        keymap.set("n", "<leader>fad", ":FlutterRun --flavor dev -t lib/main_dev.dart<cr><C-w>x")
        keymap.set("n", "<leader>fa", ":FlutterRun<cr><C-w>x")
        keymap.set("n", "<leader>fq", ":FlutterQuit<cr>")
        keymap.set("n", "<leader>fr", ":FlutterHotReload<cr>")
        keymap.set("n", "<leader>fR", ":FlutterHotRestart<cr>")
        keymap.set("n", "<leader>fD", ":FlutterVisualDebug<cr>")
    end
}
