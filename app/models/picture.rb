class Picture < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :type_of_picture
  validates_presence_of :device
  validates_presence_of :location
  validates_presence_of :year

  has_one_attached :personal_pic
end