local status_ok, auto-session = pcall(require, "auto-session")
if not status_ok then
 return
end

auto-session.setup({
  auto_session_suppress_dirs = {'~/.config/nvim/session'}
})
