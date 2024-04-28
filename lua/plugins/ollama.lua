return {
  "nomnivore/ollama.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  -- All the user commands added by the plugin
  cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

  keys = {
    -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
    {
      "<leader>oo",
      ":<c-u>lua require('ollama').prompt()<cr>",
      desc = "ollama prompt",
      mode = { "n", "v" },
    },

    -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
    {
      "<leader>oG",
      ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
      desc = "ollama Generate Code",
      mode = { "n", "v" },
    },
  },

  ---@type Ollama.Config
  opts = {
    model = "mixtral",
    --url = "http://10.0.3.1:11435",
    --model = "codellama",
    --model = "codellama:7b-code-q4_0",
    --model = "keesj",
    -- your configuration overrides
    --        prompt = "Rewrite as Riscure security analyst: ceives $input and $sel(ection), among others.",
    prompts = {
      AA_Mixtral_Rewrite_Prof_Long = {
        prompt = "Rewrite the following text to make it look more professional:\n\n $sel",
        input_label = "> ",
        model = "mixtral",
        action = "display",
      },
      AA_QuickSecRev = {
        prompt = "Any obvious security issues in the following code? keep it short:\n\n $sel",
        input_label = "> ",
        model = "mistral",
        action = "display",
      },
      --      MixtralFuzz = {
      --        prompt = "Create a lib fuzzer fuzzing harness for the following code: $sel",
      --        input_label = "> ",
      --        model = "mixtral",
      --        action = "display",
      --      },
    },
  },
}
