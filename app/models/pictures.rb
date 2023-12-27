class Pictures < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :type
  validates_presence_of :device
  validates_presence_of :location
  validates_presence_of :year
end