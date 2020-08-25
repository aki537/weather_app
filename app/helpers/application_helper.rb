module ApplicationHelper
  require 'json'
  require 'open-uri'
  require 'date'

  def today
    d = Date.today
    month = d.month
    mday = d.day
    day = "#{month}月#{mday}日"
  end

  def fashion_comment(temp)
    if temp < 6
      return "ダウンジャケット"
    elsif temp >= 7 && temp < 11
      return "厚手のコート"
    elsif temp >= 12 && temp <15
      return "薄手のコート、セーター"
    elsif temp >= 16 && temp < 20
      return "ジャケット、カーディガン"
    elsif temp >= 20 && temp < 25
      return "半袖シャツ、長袖シャツ"
    elsif temp >=25
      return "半袖シャツ"
    end
    
  end

  def wind_deg(d)
    deg = d.to_f
    if deg > 22.5 && deg <= 67.5
      return "北東"
    elsif deg > 67.5 && deg <= 112.5
      return "東"
    elsif deg > 112.5 && deg <= 157.5
      return "南東"
    elsif deg > 157.5 && deg <= 202.5
      return "南"
    elsif deg > 202.5 && deg <= 247.5
      return "南西"
    elsif deg > 247.5 && deg <= 292.5
      return "西"
    elsif deg > 292.5 && deg <= 337.5
      return "北西"
    else deg > 337.5 || deg <= 22.5
      return "北"
    end
  end

  def pop_h(n)
    pop = @myarea["hourly"][n]["pop"]*100
  end

  def pop_d(n)
    pop = @myarea["daily"][n]["pop"]*100
  end
  
  def hour_c(time)
    t = Time.zone.at(time).hour
  end
  
  def day_c(dt)
    d = Time.zone.at(dt)
    month = d.month
    mday = d.day
    day = "#{month}/#{mday}"
  end

end
