class User < ActiveRecord::Base
	belongs_to :admin, :foreign_key => 'admin_id', :class_name => 'Admin'
	has_many :admins, :foreign_key => 'admin_id', :class_name => 'Admin'


	validates :name, presence: true
	validates :contact, presence: true
	validates :admin_id, presence: true
end
