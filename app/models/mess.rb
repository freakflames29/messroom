class Mess < ApplicationRecord
	belongs_to :user
	has_many_attached :images

	validates :price, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :adrs, presence: true
	validates :pincode, presence: true
	validates :landmark, presence: true
	validates :description, presence: true,length:{minimum:20}
	# validates :service_boys_only, presence: true
	# validates :service_girls_only, presence: true
	# validates :student_boys_only, presence: true
	# validates :student_girls_only, presence: true
	# validates :for_all, presence: true
	# validates :room_available, presence: true
	validates :title, presence: true

	validates :images,presence: true
end
