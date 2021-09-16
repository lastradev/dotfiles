
local present, saga = pcall(require, "lspsaga")
if not present then
    return
end

saga.init_lsp_saga {
  code_action_prompt = {
    enable = false,
    sign = false,
    sign_priority = 20,
    virtual_text = true,
  },
}
