module ApplicationHelper

  def febreze_light
    require 'uri'
    require 'net/http'

    url = URI("https://na-hackathon-api.arrayent.io:443/v3/devices/33554441")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Put.new(url)
    request["authorization"] = 'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRfaWQiOiI2MDU5ZTExMC0wMTFhLTExZTctOTIwNy1iNWMzYjY2M2Y2YTQiLCJlbnZpcm9ubWVudF9pZCI6Ijk0OGUyY2YwLWZkNTItMTFlNi1hZTQ2LTVmYzI0MDQyYTg1MyIsInVzZXJfaWQiOiI5MDAwMDg0Iiwic2NvcGVzIjoie30iLCJncmFudF90eXBlIjoiYXV0aG9yaXphdGlvbl9jb2RlIiwiaWF0IjoxNDg4NjYzMzM0LCJleHAiOjE0ODk4NzI5MzR9.nJGTrEkQzNdx4f8FyMXkH3I7g7vh1AQ-cldkOv6HC_0JFjl3MC74vFgzk-wuSYw2r1MuYwI_uEbnKiDDTb65Fw'
    request["content-type"] = 'application/json'
    request["cache-control"] = 'no-cache'
    request["postman-token"] = 'a94141b7-bbe3-6e72-5602-591644b18d92'
    request.body = "[{\"DeviceAction\": \"led_mode=1\" }, {\"DeviceAction\": \"led_color=0,2,4,4,4\" }]"

    response = http.request(request)
    puts response.read_body
  end

end
