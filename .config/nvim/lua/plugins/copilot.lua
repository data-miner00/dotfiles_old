return {
  "github/copilot.vim",
  config = function()
    -- For first time use, run `:Copilot setup` within neovim
    -- This will generate a one-time password to authenticate with GitHub
    -- Copy the password, hit 'Enter' as prompted and it will open GitHub authentication in browser
    -- Paste the password and press 'Authenticate'
    -- It should then show 'Congratulations, you're all set!' and it is done
  end,
  enabled = true,
}
