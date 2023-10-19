--
-- Tweak flash.nvim to not take over the s keys
-- as s stands for substiture and not search
--
return {
  "folke/flash.nvim",
  keys = {
    -- disable the default flash keymap
    { "s", mode = { "n", "x", "o" }, false },
  },
}
