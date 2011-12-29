class AccountController < ApplicationController
  def index
  end

  def login
	  unless current_user.nil?
	  	flash[:notice] ="you already logged in."
	  	redirect_to(:action=> "index")
	  end
  end

  def register
  	@user = User.new
  end
  
  def authenticate_user
  	if current_user.nil?
  		authorized_user = User.authenticate(params[:username], params[:password])
		if authorized_user
			session[:current_user_id] = authorized_user.id
			flash[:notice] ="you ssss logged in. #{current_user}"
			redirect_to(:action => 'index')
		else
			flash[:notice] = "please provide valid username/password"
			redirect_to(:action => 'login')
		end
	else
		render :text => current_user.class
	end
  end

  def change_pwd
  end
  
  def logout
  	session[:current_user_id] = nil
  	reset_session
    flash[:notice] = "You have been logged out."
    redirect_to(:action => "login")
  end
end
