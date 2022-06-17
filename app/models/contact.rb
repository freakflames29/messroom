class Contact < ApplicationRecord
	validates :name,presence:true
	validates :email,presence:true
	validates :title,presence:true
	validates :body,presence:true
end
