class ApplicationController < ActionController::Base
	helper_method :current_user, :logged_in?,:admin_user,:admin_user_profile

  def current_user
    @current_user=nil
    if session[:user_id]
      @current_user ||= User.find(session[:user_id]) 
    end
    @current_user
  end

  def logged_in?
    !!current_user # it is used to convert current_user return into a boolean
  end

  def require_user
    unless logged_in?
      flash[:fail] = 'You have to be logged in first to perform that action'
      redirect_to root_path

    end
  end

  def redirect_if_loggedin
    if logged_in?
      flash[:notice] = "you are logged in already"
      redirect_to root_path
    end
  end

  def check_owner_profile
    if logged_in?
      if !current_user.is_owner
        flash[:fail]='You need a owner account to upload your mess info!'
        redirect_to root_path
      end
    else
      flash[:fail]='You need to login first'
      redirect_to root_path
    end
  end


  def admin_user
    if logged_in? and current_user.id.eql? 5
      return true
    else
      return false
    end

  end


  def admin_user_profile
    @admin=User.find 5
  end

end
