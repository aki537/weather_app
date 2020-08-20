require 'csv'

csv = CSV.read('db/fixtures/prefecture.csv')
csv.each do |area|
  Area.seed do |a|
    a.id = area[0]
    a.prefecture = area[1]
    a.prefecture_r = area[2]
    a.lat = area[3]
    a.lon = area[4]
  end
end










# Area.seed(:id,
#   { :id => 1, :prefecture => "北海道", :prefecture_r => "hokkaido" },
#   { :id => 2, :prefecture => "青森県", :prefecture_r => "aomori" },
#   { :id => 3, :prefecture => "岩手県", :prefecture_r => "iwate" },
#   { :id => 4, :prefecture => "宮城県", :prefecture_r => "miyagi" },
#   { :id => 5, :prefecture => "秋田県", :prefecture_r => "akita" },
#   { :id => 6, :prefecture => "山形県", :prefecture_r => "yamagata" },
#   { :id => 7, :prefecture => "福島県", :prefecture_r => "fukushima" },
#   { :id => 8, :prefecture => "茨城県", :prefecture_r => "ibaraki" },
#   { :id => 9, :prefecture => "栃木県", :prefecture_r => "tochigi" },
#   { :id => 10, :prefecture => "群馬県", :prefecture_r => "gunma" },
#   { :id => 11, :prefecture => "埼玉県", :prefecture_r => "saitama" },
#   { :id => 12, :prefecture => "千葉県", :prefecture_r => "chiba" },
#   { :id => 13, :prefecture => "東京都", :prefecture_r => "tokyo" },
#   { :id => 14, :prefecture => "神奈川県", :prefecture_r => "kanagawa" },
#   { :id => 15, :prefecture => "新潟県", :prefecture_r => "niigata" },
#   { :id => 16, :prefecture => "富山県", :prefecture_r => "toyama" },
#   { :id => 17, :prefecture => "石川県", :prefecture_r => "ishikawa" },
#   { :id => 18, :prefecture => "福井県", :prefecture_r => "fukui" },
#   { :id => 19, :prefecture => "山梨県", :prefecture_r => "yamanashi" },
#   { :id => 20, :prefecture => "長野県", :prefecture_r => "nagano" },
#   { :id => 21, :prefecture => "岐阜県", :prefecture_r => "gifu" },
#   { :id => 22, :prefecture => "静岡県", :prefecture_r => "shizuoka" },
#   { :id => 23, :prefecture => "愛知県", :prefecture_r => "aichi" },
#   { :id => 24, :prefecture => "三重県", :prefecture_r => "mie" },
#   { :id => 25, :prefecture => "滋賀県", :prefecture_r => "shiga" },
#   { :id => 26, :prefecture => "京都府", :prefecture_r => "kyoto" },
#   { :id => 27, :prefecture => "大阪府", :prefecture_r => "osaka" },
#   { :id => 28, :prefecture => "兵庫県", :prefecture_r => "hyogo" },
#   { :id => 29, :prefecture => "奈良県", :prefecture_r => "nara" },
#   { :id => 30, :prefecture => "和歌山県", :prefecture_r => "wakayama" },
#   { :id => 31, :prefecture => "鳥取県", :prefecture_r => "tottori" },
#   { :id => 32, :prefecture => "島根県", :prefecture_r => "shimane" },
#   { :id => 33, :prefecture => "岡山県", :prefecture_r => "okayama" },
#   { :id => 34, :prefecture => "広島県", :prefecture_r => "hiroshima" },
#   { :id => 35, :prefecture => "山口県", :prefecture_r => "yamaguchi" },
#   { :id => 36, :prefecture => "徳島県", :prefecture_r => "tokushima" },
#   { :id => 37, :prefecture => "香川県", :prefecture_r => "kagawa" },
#   { :id => 38, :prefecture => "愛媛県", :prefecture_r => "ehime" },
#   { :id => 39, :prefecture => "高知県", :prefecture_r => "kochi" },
#   { :id => 40, :prefecture => "福岡県", :prefecture_r => "fukuoka" },
#   { :id => 41, :prefecture => "佐賀県", :prefecture_r => "saga" },
#   { :id => 42, :prefecture => "長崎県", :prefecture_r => "nagasaki" },
#   { :id => 43, :prefecture => "熊本県", :prefecture_r => "kumamoto" },
#   { :id => 44, :prefecture => "大分県", :prefecture_r => "oita" },
#   { :id => 45, :prefecture => "宮崎県", :prefecture_r => "miyazaki" },
#   { :id => 46, :prefecture => "鹿児島県", :prefecture_r => "kagoshima" },
#   { :id => 47, :prefecture => "沖縄県", :prefecture_r => "okinawa" }
# )