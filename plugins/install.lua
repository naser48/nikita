function run(msg, matches)
if not is_sudo(msg) then
return 
end
text = io.popen(" ./launch.sh install "):read('*all')
  return text
end
return {
  patterns = {
    '^[#/!]install$'
  },
  run = run,
  moderated = true
}
