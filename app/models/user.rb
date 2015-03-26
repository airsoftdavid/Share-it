class User < ActiveRecord::Base
	validates :name, presence: true, { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :contact, presence: true, { maximum: 11 }, 
	format: { with: VALID_EMAIL_REGEX }, 
	uniqueness: { case_sensitive: false }
end
