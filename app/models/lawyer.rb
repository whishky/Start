class Lawyer < ActiveRecord::Base
	attr_accessor :remember_token
	before_save {self.email_id = email_id.downcase}
	validates :name, presence: true, length: {maximum: 100}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email_id, presence: true, length: { maximum: 222}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
	has_secure_password
	validates :password, presence: true, length: {minimum: 3}
	
	def Lawyer.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	def Lawyer.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token = Lawyer.new_token
		update_attribute(:remember_digest, Lawyer.digest(remember_token))
	end

	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	def forget
		update_attribute(:remember_digest, nil)
	end
end
