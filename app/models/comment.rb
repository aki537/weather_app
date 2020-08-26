class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :area

  validates :content, presence: true, length: { maximum: 100}
  validates :temp, presence: true
  validates :humidity, presence: true

  enum weather: {
    Clear: 0,
    Clouds: 1,
    Drizzle: 2,
    Rain: 3,
    Snow: 4,
    Thunderstorm: 5,
    Mist: 6,
    Smoke: 7,
    Haze: 8,
    Dust: 9,
    Fog: 10,
    Sand: 11,
    Ash: 12,
    Squall: 13,
    Tornado: 14
  }

  has_many :good ,dependent: :destroy
  has_many :goodusers, through: :good, source: :user
  has_many :bad ,dependent: :destroy
  has_many :badusers, through: :bad, source: :user


end
