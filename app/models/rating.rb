class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :mess

  validates :rating,presence: true
end
