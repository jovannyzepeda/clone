class User < ApplicationRecord
	has_many :courses
	#encriptar password con gema bcript
	require "bcrypt"
	before_create :set_encrypt_password
	validates :username, presence: true, uniqueness: true, length: { in: 3..20 }

	#encriptar contraseña de usuario
	def set_encrypt_password
		self.password = BCrypt::Password.create self.password
	end
	#comparar si password es el mismo-s
	def is_valid_password?(password)
		self.password == BCrypt::Engine.hash_secret(password, self.password)
	end
end
