require('telescope').setup {
    defaults = {
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        theme = "dropdown",
        layout_config = {
            prompt_position = "top",
            preview_cutoff = 20
        },
    }
}

-- EXTENSIONS
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require("telescope").load_extension('harpoon')
