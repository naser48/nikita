
do

function run(msg, matches)
       if not is_owner(msg) then
        return "⛔️ شما دسترسی ندارید ⛔️"
       end
    local data = load_data(_config.moderation.data)
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
       if not group_link then 
        return "➕ اول یک لینک جدید با دستور /newlink بسازید ➕"
       end
         local text = "🔘 لینک سوپر گروه   :\n"..group_link
          send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
           return "✅ لینک گروه در چت خصوصی ارسال شد ✅"
end

return {
  patterns = {
    "^[/#!]([Ll]inkpv)$"
    "^(لینک شخصی)$"
  },
  run = run
}

end
