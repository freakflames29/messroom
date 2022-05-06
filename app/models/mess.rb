class Mess < ApplicationRecord
	belongs_to :user

	has_many_attached :images

	has_many :reviews
	
	validates :price, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :adrs, presence: true
	validates :pincode, presence: true
	validates :landmark, presence: true
	validates :description, presence: true,length:{minimum:20}
	
	validates :title, presence: true

	validates :images,presence: true
end
