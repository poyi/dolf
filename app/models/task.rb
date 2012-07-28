class Task < ActiveRecord::Base

	belongs_to :user

	attr_accessible :detail, :completed, :user_id

	validates_presence_of :detail, :user_id
	validate :user_exists

	protected

	def user_exists
		errors.add(:user_id, "User doesn't exist..") unless User.exists?(user_id)
	end

end
