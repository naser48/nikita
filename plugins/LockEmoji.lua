local function run(msg, matches)
    if is_momod(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['lock_emoji'] then
                lock_emoji = data[tostring(msg.to.id)]['settings']['lock_emoji']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_emoji == "yes" then
        send_large_msg(channel, '')
		      savelog(msg.to.id,"")-- Save to logs
        delete_msg(msg.id, ok_cb, false)

    end
end
 
return {
  patterns = {
    "😀","😬","😁","😂","😃","😄","😅","😆","😇","😉","😊","🙂","🙃","☺️","😚","😙","😗","😘","😍","😌","😋","😜","😝","😛","🤑","🤓","😎","🤗","🤔","🙄","😒","😑","😐","😶","😏","😳","😞","😟","😠","😡","😔","😕","😤","😩","😫","😖","😣","☹️","🙁","😮","😱","😨","😰","😯","😦","😧","😲","😵","😭","😓","😪","😥","😢","🤐","😷","🤒","🤕","😴","💤","💩","👽","👻","💀","👺","👹","👿","😈","💋", "👊","🔘","✔️","⚠️","👆","🖕","🖐","👍",
  },
  run = run
}
