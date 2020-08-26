class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: {maximum: 50 }

  belongs_to :area
  
  validates :email, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    allow_blank: true,
                    uniqueness: { case_sensitive: false }
  validates :email, presence: true
  has_secure_password

  has_many :comments

end
