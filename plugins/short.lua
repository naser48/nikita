local function run(msg, matches)
	local htp = http.request('http://api.gpmod.ir/shorten/?url='..URL.escape(matches[1])..'&username=mohamad.khoshnava@gmail.com')
		return 'لینک کوتاه شده شما : \n\n___________________________\n'..htp..'\n___________________________'
end
return {
  patterns = {
    "^[!#/][Ss][Hh][Oo][Rr][Tt] (.*)$"
  },
  run = run
}
