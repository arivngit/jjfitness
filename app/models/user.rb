require 'digest/sha1'

class User < ActiveRecord::Base

	attr_accessor :password
	
	before_save :create_hashed_password
		
	def self.make_salt(username)
		Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")		
	end
	
	def self.hash_with_salt(password="", salt="")
		Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
	end
	
	def self.authenticate(username="", password="")
		user = User.find_by_username(username)
		if user && user.password_match?(password)
		  return user
		else
		  return false
		end
	end
	
	def self.this_salt(salt="")
	puts "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
		salt
	end

	# The same password string with the same hash method and salt
	# should always generate the same hashed_password.
	def password_match?(password="")
		hashed_password == User.hash_with_salt(password, salt)
	end

	
	
  private
	def create_hashed_password
		unless password.blank?
			self.salt = User.make_salt(username) if salt.blank?
			self.hashed_password = User.hash_with_salt(password, salt)
		end
	end
	
end
