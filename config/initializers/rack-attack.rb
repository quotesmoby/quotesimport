class Rack::Attack
  blacklist("block referer spam") do |request|
    spammers = [/co\.lumb\.co/, /darodar/, /free\-share\-buttons\.com/, /Get\-Free\-Traffic\-Now\.com/, /event\-tracking/,/free\-social\-buttons/]
    spammers.find { |spammer| request.referer =~ spammer }
  end
end