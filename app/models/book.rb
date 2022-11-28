class Book < ApplicationRecord
  has_one_attached :profile_image
  belongs_to :user
  
  def get_profile_image(width, height)
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
