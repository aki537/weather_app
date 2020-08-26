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

  has_many :comments, dependent: :destroy

  has_many :good, dependent: :destroy
  has_many :goodcomment, through: :good, source: :comment
  has_many :bad, dependent: :destroy
  has_many :badcomment, through: :bad, source: :comment

  def good?(other_comment)
    self.goodcomment.include?(other_comment)
  end

  def bad?(other_comment)
    self.badcomment.include?(other_comment)
  end
  
  def ungood(other_comment)
    ungood = self.good.find_by(comment_id: other_comment.id)
    ungood.destroy if ungood
  end
  
  def unbad(other_comment)
    unbad = self.bad.find_by(comment_id: other_comment.id)
    unbad.destroy if unbad
  end

  def goodpost(other_comment)
    if bad?(other_comment)
      unbad(other_comment)
    end
    self.good.find_or_create_by(comment_id: other_comment.id)
  end
  
  def badpost(other_comment)
    if good?(other_comment)
      ungood(other_comment)
    end
    self.bad.find_or_create_by(comment_id: other_comment.id)
  end

    
  end
