class User < ActiveRecord::Base
  belongs_to :admin, :foreign_key => 'admin_id', :class_name => 'Admin'
  has_many :admins, :foreign_key => 'admin_id', :class_name => 'Admin'


  validates :name, presence: true, length: {maximum: 50}
  VALID_CONTACT_REGEX = /\d[0-9]\)*\z/
  validates :contact, presence: true, length: { maximum: 11 },
    format: { with: VALID_CONTACT_REGEX }
  validates :admin_id, presence: true




  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Returns the hash digest of the given string.
  def digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def new_token
    SecureRandom.urlsafe_base64
  end




  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Forgets a user.
  def forget_user
    update_attribute(:remember_digest, nil)
  end
end
