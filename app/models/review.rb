class Review < ApplicationRecord
  belongs_to :mess,dependent: :destroy
  belongs_to :user,dependent: :destroy

  validates :body,presence:true
end
