class User < ActiveRecord::Base
	has_secure_password
	has_many :articles
	has_many :comments

	

	def editor?
		self.role == "editor"
	end 


	def pic?
		self.image == nil
	end 
	
end
