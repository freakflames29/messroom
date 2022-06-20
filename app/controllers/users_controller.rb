class UsersController < ApplicationController
  before_action :redirect_if_loggedin, only: %i[new create mess_owner mess_owner_create]

  before_action :set_params, only: %i[show edit]

  before_action :check_user_validity, only: %i[edit update destroy]

  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new filter_params

    if @user.password.size < 6
      flash[:fail] = 'Password is too short minimum in 6 charectors'
      render :new
    elsif @user.valid?
      if @user.save
        flash[:win] = 'You signed up successfully ! signin to continue'
        redirect_to signin_path
      end
    else
      render :new

    end
  end

  def show
    @messes = @user.messes
  end

  def edit
    @user = User.find params[:id]
    @owner = @user.is_owner
  end

  def update
    @user = User.find params[:id]
    # render plain:params[:user][:password]

    if params[:user][:password].size < 6
      flash[:fail] = 'Password is too short minimum in 6 charectors'
      render :edit
    else
      if @user.is_owner
        if @user.update(filter_params_owner)
          flash[:win] = 'Account updated !'
          redirect_to @user
        else
          flash[:fail] = 'Error occured !'
          render :edit

        end
      elsif @user.update(filter_params)
        flash[:win] = 'Account updated !'
        redirect_to @user
      else
        flash[:fail] = 'Error occured !'
        render :edit
      end
    end
  end


  def destroy
    @user=User.find params[:id]
    if @user.destroy
      flash[:win]='Your account deleted !'
      session[:user_id]=nil
      redirect_to root_path
    end
  end


  def mess_owner
    @mess_owner = User.new
  end

  def mess_owner_create
    @mess_owner = User.new filter_params_owner
    @mess_owner.is_owner = true

    if @mess_owner.valid?
      if @mess_owner.save
        flash[:win] = 'You signed up successfully ! signin to continue'
        redirect_to signin_path
      end
    else
      render :mess_owner
    end
  end

  private

  def filter_params
    params.require(:user).permit(:name, :username, :gender, :email,  :city, :state, :address, :phone, :pincode, :password,
                                 :password_confirmation)
  end

  def filter_params_owner
    params.require(:user).permit(:name, :username, :gender, :email,  :city, :state, :address, :phone, :pincode, :password,
                                 :password_confirmation, :adh)
  end

  def set_params
    @user = User.find params[:id]
  end

  def check_user_validity
    @user = User.find params[:id]
    if !@user.eql?(current_user) && !admin_user
      flash[:fail] = "You can't perform this action"
      redirect_to @user
    end
  end
end
