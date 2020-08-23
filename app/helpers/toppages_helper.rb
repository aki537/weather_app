module ToppagesHelper
  

  def weather_area_h(prefecture)
    url = "http://api.openweathermap.org/data/2.5/forecast"
    api_key = ENV['API_KEY']

    response = open(url + "?q=#{prefecture},jp&units=metric&lang=ja&APPID=#{api_key}&cnt=1")
    JSON.pretty_generate(JSON.parse(response.read))
  end

  def weather_area_y(lat,lon)
    url = "http://api.openweathermap.org/data/2.5/onecall/timemachine"
    api_key = ENV['API_KEY']

    response = open(url + "?lat=#{lat}&lon=#{lon}&units=metric&lang=ja&dt=#{Time.current.to_i}&APPID=#{api_key}&cnt=1")
    JSON.pretty_generate(JSON.parse(response.read))
  end

  def weather_area_s(lat,lon)
    url = "http://api.openweathermap.org/data/2.5/onecall/timemachine"
    api_key = ENV['API_KEY']
    time = Time.current.yesterday

    response = open(url + "?lat=#{lat}&lon=#{lon}&units=metric&lang=ja&dt=#{time.to_i}&APPID=#{api_key}&cnt=1")
    JSON.pretty_generate(JSON.parse(response.read))
  end

end
