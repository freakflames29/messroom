class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5, maximum: 15 }

  VALID_EMAIL_REGEX = /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  validates :email, presence: true, uniqueness: { case_sensetive: false },
            format: { with: VALID_EMAIL_REGEX, multiline: true }

  validates :password, length: { minimum: 6, maximum: 15 }

  validates :name, presence: true
  validates :phone, presence: true
  validates :gender, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :address, presence: true
  validates :pincode, presence: true
  validates :adh, presence: true,length:{is:12}

end
