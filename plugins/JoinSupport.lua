do
    local function run(msg, matches)
    local support = '1058321095'
    local data = load_data(_config.moderation.data)
    local name_log = user_print_name(msg.from)
        if matches[1] == 'jsupport' then
        local group_link = data[tostring(support)]['settings']['set_link']
    return "> Joker Anti Spam Support:\n"..group_link
    end
end
return {
    patterns = {
    "^[!/#](jsupport)$",
    run = run
}
end
--By Joker Team
