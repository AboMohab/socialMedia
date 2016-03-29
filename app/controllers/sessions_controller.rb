class SessionsController < ApplicationController

before_action :require_no_user,only: [:new,:create]


	def new 

	end

	def create 
		@user=User.find_by_email(params[:session][:email]) 

		if @user && @user.authenticate(params[:session][:password]) && @user.image == nil
			session[:user_id] =@user.id 
			@user.update(image:'pic.png')
			redirect_to '/'

		elsif @user && @user.authenticate(params[:session][:password])
			session[:user_id] =@user.id 
			redirect_to '/'
		else	

			redirect_to '/login'
		end 
	end 

	def destroy
		session[:user_id] = nil
		redirect_to '/'

	end


end
