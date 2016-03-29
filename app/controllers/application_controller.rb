class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  helper_method :other_user
  def other_user
  @other_user = User.find(params[:id])
  end 

  def require_user
    redirect_to '/login' unless current_user
  end 

  def require_no_user
    redirect_to '/' if current_user
  end 

  def require_editor 
    redirect_to '/' unless current_user.editor?
  end 

 
 def require_pic
  current_user.update(image:'pic.png') if current_user.image == nil || current_user.image == ""
end 
  

end
