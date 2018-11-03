class Boke < ApplicationRecord
  belongs_to :odai
  belongs_to :user
  has_many :comments
  has_many :stars,dependent: :destroy
  has_many :boke_tags
  has_many :tags ,through: :boke_tags

  def star_user(user_id)
   stars.find_by(user_id: user_id)
  end

  def star1
   stars.find_by(status: 1)
  end

  def star2
   stars.find_by(status: 2)
  end

  def star3
   stars.find_by(status: 3)
  end
end
