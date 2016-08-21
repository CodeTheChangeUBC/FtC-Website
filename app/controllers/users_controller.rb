class UsersController < ApplicationController
  before_action :logged_in_user,  only: [:edit, :update, :destroy]
  before_action :correct_user,    only: [:edit, :update]
  before_action :admin_user,      only: [:destroy, :make_exec, :unmake_exec,
                                         :sign_up_for_event, :opt_out_of_event]

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated
  end

  def index
    # Show users iff they are activated
    @execs = User.where(exec: true, activated: true, admin: false)
    @users = User.where(exec: false, activated: true, admin: false).paginate(page: params[:page])
  end

  def create 
  	@user = User.new(user_params)
  	if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account. See you soon!"
      redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update 
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy 
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url 
  end

  def sign_up_for_event
    @event = Event.find(params[:event_id])
    @user = current_user
    if @user.sign_up_for_event(@event)
      flash[:success] = "You've been signed up for #{@event.title}!"
    end
    redirect_to @event
  end

  def opt_out_of_event
    @event = Event.find(params[:event_id])
    @user = current_user
    if @user.opt_out_of_event(@event)
      flash[:info] = "You're no longer signed up for #{@event.title}"
    end
    redirect_back_or events_url
  end

  def make_exec 
    @user = User.find(params[:user_id])
    if @user.make_exec
      flash[:success] = "#{@user.name} is now a club executive."
    else
      flash[:warning] = "Sorry, something went wrong."
    end
    redirect_back_or users_url
  end

  def unmake_exec
    @user = User.find(params[:user_id])
    if @user.unmake_exec
      flash[:info] = "#{@user.name} is no longer an executive."
    else
      flash[:warning] = "Sorry, something went wrong."
    end
    redirect_back_or users_url
  end

  private 

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation, 
                                   :avatar)
  	end

    # Before filters

    # Confirms a logged in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
