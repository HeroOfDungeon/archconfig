return {
  "dustinblackman/oatmeal.nvim",
  cmd = { "Oatmeal" },
  keys = {
      { "<leader>o", mode = "n", desc = "Start Oatmeal session" },
  },
  opts = {
      backend = "ollama",
      model = "codellama:7b",
  },
}
