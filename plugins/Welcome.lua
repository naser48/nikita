﻿local function run(msg, matches, callback, extra)

local data = load_data(_config.moderation.data)

local group_welcome = data[tostring(msg.to.id)]['group_welcome']
-------------------------- Data Will be save on Moderetion.json
    
if matches[1] == 'delwlc' and not matches[2] and is_owner(msg) then 
    
   data[tostring(msg.to.id)]['group_welcome'] = nil --delete welcome
        save_data(_config.moderation.data, data)
        
        return '❌ خوش آمد گویی حذف شد ❌'
end
if not is_owner(msg) then 
    return '⛔️ شما دسترسی ندارید ⛔️'
end
--------------------Loading Group Rules
local rules = data[tostring(msg.to.id)]['rules']
    
if matches[1] == 'rules' and matches[2] and is_owner(msg) then
    if data[tostring(msg.to.id)]['rules'] == nil then --when no rules found....
        return '💢 قانونی برای گروه یافت نشد 💢\n\nقانون گروه را با دستور /setrules [قانون] تنظیم کنید\nیا با دستور /setwlc [متن خوش آمد گویی] از خوش آمد گویی ساده استفاده کنید'
end
data[tostring(msg.to.id)]['group_welcome'] = matches[2]..'\n\nGroup Rules :\n'..rules
        save_data(_config.moderation.data, data)
        
        return '✅ متن زیر به عنوان خوش آمد گویی تنظیم شد ✅ : \n'..matches[2]
end
if not is_owner(msg) then 
    return '⛔️ شما دسترسی ندارید ⛔️'
end

if matches[1] and is_owner(msg) then
    
data[tostring(msg.to.id)]['group_welcome'] = matches[1]
        save_data(_config.moderation.data, data)
        
        return '✅ متن زیر به عنوان خوش آمد گویی تنظیم شد ✅ : \n'..matches[1]
end
if not is_owner(msg) then 
    return 'For Owners Only!'
end


    
end
return {
  patterns = {
  "^[!#/]setwlc (rules) +(.*)$",
  "^[!#/]setwlc +(.*)$",
  "^[!#/](delwlc)$"
  },
  run = run
}