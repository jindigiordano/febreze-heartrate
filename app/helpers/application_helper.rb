module ApplicationHelper
  auth_token = "ya29.GlsFBBCcrPbFE6COV6pKaCrncvWVMTVYJ1Xq5fYMA8QDImb0xzKp2v2iddxH0UDE_otWkqOzSpVqmoytjLIQ5urZYHj2SJ_QLEoVIxL3TEW5g4lviKBtjSb1aoj8"

  def google_sheet_evening
    require 'uri'
    require 'net/http'

    url = URI("https://sheets.googleapis.com/v4/spreadsheets/1CU0AYzap4OMN0yieA5vA4zCdZvoy5sfKBprl16y2kUc/values/Sheet1!A1")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["authorization"] = 'Bearer #{auth_token}'
    request["content-type"] = 'application/json'
    request["cache-control"] = 'no-cache'
    puts request

    response = http.request(request)
    puts response.read_body
    if JSON.parse(response.read_body)["values"]
      p JSON.parse(response.read_body)["values"][0][0]
    else
      nil
    end
  end


  def google_sheet_morning
    require 'uri'
    require 'net/http'

    url = URI("https://sheets.googleapis.com/v4/spreadsheets/1HIXWAVU-DW23WorZqU5hV5aS2T6TM9ENpxlzGT2_N7A/values/Sheet1!A1")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["authorization"] = 'Bearer #{auth_token}'
    request["content-type"] = 'application/json'
    request["cache-control"] = 'no-cache'
    puts request

    response = http.request(request)
    puts response.read_body
    if JSON.parse(response.read_body)["values"]
      p JSON.parse(response.read_body)["values"][0][0]
    else
      nil
    end
  end


  def google_sheet_night
    require 'uri'
    require 'net/http'

    url = URI("https://sheets.googleapis.com/v4/spreadsheets/1DmI8wo2BHyU9loVf3NVh86dYd-SAnItNIy9-eiSULjI/values/Sheet1!A1")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["authorization"] = 'Bearer #{auth_token}'
    request["content-type"] = 'application/json'
    request["cache-control"] = 'no-cache'
    puts request

    response = http.request(request)
    puts response.read_body
    if JSON.parse(response.read_body)["values"]
      p JSON.parse(response.read_body)["values"][0][0]
    else
      nil
    end
  end


  def febreze_light(word)
    require 'uri'
    require 'net/http'

    if word == 'theEvening'
      light_num = 2
    elsif word == 'myMorning'
      light_num = 4
    elsif word == 'myNight'
      light_num = 12
    elsif word == nil
      light_num = 14
    end

    url = URI("https://na-hackathon-api.arrayent.io:443/v3/devices/33554441")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Put.new(url)
    request["authorization"] = 'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRfaWQiOiI2MDU5ZTExMC0wMTFhLTExZTctOTIwNy1iNWMzYjY2M2Y2YTQiLCJlbnZpcm9ubWVudF9pZCI6Ijk0OGUyY2YwLWZkNTItMTFlNi1hZTQ2LTVmYzI0MDQyYTg1MyIsInVzZXJfaWQiOiI5MDAwMDg0Iiwic2NvcGVzIjoie30iLCJncmFudF90eXBlIjoiYXV0aG9yaXphdGlvbl9jb2RlIiwiaWF0IjoxNDg4NjYzMzM0LCJleHAiOjE0ODk4NzI5MzR9.nJGTrEkQzNdx4f8FyMXkH3I7g7vh1AQ-cldkOv6HC_0JFjl3MC74vFgzk-wuSYw2r1MuYwI_uEbnKiDDTb65Fw'
    request["content-type"] = 'application/json'
    request["cache-control"] = 'no-cache'
    request["postman-token"] = 'a94141b7-bbe3-6e72-5602-591644b18d92'
    request.body = "[{\"DeviceAction\": \"led_mode=1\" }, {\"DeviceAction\": \"led_color=0,#{light_num},4,4,4\" }]"

    response = http.request(request)
    puts response.read_body
  end

end
