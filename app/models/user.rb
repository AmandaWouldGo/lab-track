require 'bcrypt'
class User < ApplicationRecord
 # users.password_hash in the database is a :string
 has_many :user_proposals
 has_many :proposals, through: :user_proposals
 has_many :votes, dependent: :destroy
 has_many :comments, dependent: :destroy


 include BCrypt

 def password
 	@password ||= Password.new(password_hash)
 end

 def password=(new_password)
 	@password = Password.create(new_password)
 	self.password_hash = @password
 end

 def authenticate(input_password)
 	self.password == input_password
 end


end
