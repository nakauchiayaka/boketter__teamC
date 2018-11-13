class Boke < ApplicationRecord
  belongs_to :user
  belongs_to :odai
  has_many :stars, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :boke_tags
  has_many :tags ,through: :boke_tags
  has_many :categorys ,through: :boke_categorys
  has_many :boke_categorys

  def star_user(user_id,boke_id)
   stars.find_by(user_id: user_id,boke_id:boke_id)
  end

  def star_status_1(user_id,boke_id)
   stars.find_by(status:1,user_id: user_id,boke_id:boke_id)
  end

  def star_status_2(user_id,boke_id)
   stars.find_by(status:2,user_id: user_id,boke_id:boke_id)
  end

  def star_status_3(user_id,boke_id)
   stars.find_by(status:3,user_id: user_id,boke_id:boke_id)
  end

  def status_calculation(boke_id,stars)
    sum = 0
    applicable_stars = stars.where(boke_id:boke_id)
    applicable_stars.each do |star|
      sum += star.status
    end
    return sum
  end
end
