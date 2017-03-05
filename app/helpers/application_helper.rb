module ApplicationHelper

  require 'net/http'

  def febreze_light
    http = Net::HTTP.new("na-hackathon-api.arrayent.io:443")

    request = Net::HTTP::Put.new("/v3/devices")
    request.body = [{"DeviceAction": "led_mode=1" }, {"DeviceAction": "led_color=0,1,4,4,4" }].to_json
    request['Authorization'] = "Bearer #{ENV['FEBREZE']}"
    request['Content-Type'] = 'application/json'
    response = http.request(request)
  end

end
