class Review < ApplicationRecord
  belongs_to :mess
  belongs_to :user

  validates :body,presence:true
end
