class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase) 
  	if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  		  redirect_back_or edit_user_path(user)
      else
        message = "Account not activated. "
        message += "Check your email for the activation link. "
        flash[:warning] = message
        redirect_to root_url
      end
  	else
  		flash.now[:danger] = 'Invalid email/password combination'
  		render 'new'
    end
  end

  # Initialize user through facebook or google API
  def create_with_api
    begin 
      @num_users = User.all.size
      user = User.from_omniauth(request.env["omniauth.auth"])
      log_in user
      if @num_users == (User.all.size - 1)
        redirect_to edit_user_path(user)
        flash[:success] = "Log in successful! Please set a password and update 
                             any additional information."
      else 
        redirect_back_or edit_user_path(user)
      end
    rescue
      flash[:warning] = "There was an error during the authentication 
                         process. "
      redirect_to root_url
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
