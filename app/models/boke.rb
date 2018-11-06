class Boke < ApplicationRecord
  belongs_to :odai
  belongs_to :user
  has_many :comments
  has_many :stars
  has_many :boke_tags
  has_many :tags ,through: :boke_tags

  def star_user(user_id)
   stars.find_by(user_id: user_id)
  end

end
