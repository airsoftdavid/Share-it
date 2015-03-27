class User < ActiveRecord::Base
	attr_accessor :remember_token
	validates :name, presence: true, length:{ maximum: 50 }
	VALID_CONTACT_REGEX = /\d[0-9]\)*\z/
	validates :contact, presence: true, 
            numericality: true, 
            length: {minimum: 7, maximum: 15}, 
	 format: { with: VALID_CONTACT_REGEX },
   uniqueness: { case_sensitive: false }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? 
    BCrypt::Engine::MIN_COST :                          
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
  	SecureRandom.urlsafe_base64
  end

  def remember
  	self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end	

  def authenticated?(remember_token)
  	return false if remember_digest.nil?
  	BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
