class UsersController < ApplicationController

	before_action :require_no_user ,only: [:new,:create]
	before_action :require_pic ,only:[:profile]




	def new
		@user = User.new
	end 

	def create 
		@user=User.new(user_params)
		if @user.save
			session[:user_id]=@user.id 
			redirect_to '/'
		else 
			redirect_to '/signup'
		end
	end 

	def profile
		@user=current_user
	end 

	def edit
		@user=current_user
	end 

	 def update 
	 	if params[:current]
        @user = current_user
        if @user.update_attributes(user_params)
        	
            redirect_to '/profile'
        else 
            redirect_to '/edit'
        end 
    elsif params[:other]
    	@other_user=User.find(params[:id])
		
		if @other_user.update_attributes(otherusers_params)
			
			redirect_to '/'
		 else 
		 	redirect_to '/manage'
		 end 
		end 

    end 
     

	def manage
		@other_users=User.all
	end 

	def show
		@other_user=User.find(params[:id])
		
	end

	def editusers
		@other_user=User.find(params[:id])
	end 

	def updateusers
				
		@other_user=User.find(params[:id])
		
		if @other_user.update_attributes(otherusers_params)
			
			redirect_to '/'
		 else 
		 	redirect_to '/manage'
		 end 
		end 		 
	 
 
	

	private 
	def user_params
		params.require(:user).permit(:first_name,:last_name,:email,:password,:image)
	end 

	private
	def otherusers_params
		params.require(:user).permit(:first_name,:last_name,:email,:role,:image,:admins)
	end 
end
