return {
  "ggandor/flit.nvim",
  dependencies = {
    "ggandor/leap.nvim",
    "tpope/vim-repeat",
  },
  event = "BufRead",
  opts = {
    keys = { f = "f", F = "F", t = "t", T = "T" },
    labeled_modes = "v",
    multiline = true,
    opts = {},
  },
}
