class UsersController < ApplicationController

  before_action :redirect_if_loggedin,only:[:new,:create,:mess_owner,:mess_owner_create]

  before_action :set_params,only: %i[show edit ]

  def index
  end

  def new
    @user=User.new
  end
  
  def create
    @user=User.new filter_params

    if @user.valid?
      if @user.save
        flash[:win]='You signed up successfully ! signin to continue'
        redirect_to signin_path
      end
    else
      render :new
    end
  end

  def show
    @messes=@user.messes
  end

  def edit
  end

  def update
  end


  def mess_owner
     @mess_owner=User.new
  end

  def mess_owner_create
    @mess_owner=User.new filter_params_owner
    @mess_owner.is_owner = true

     if @mess_owner.valid?
      if @mess_owner.save
        flash[:win]='You signed up successfully ! signin to continue'
        redirect_to signin_path
      end
    else
      render :mess_owner
    end


  end

  private
  def filter_params
    params.require(:user).permit(:name,:username,:gender,:email,  :city,:state,:address,:phone,:pincode,:password,:password_confirmation)
  end 

  def filter_params_owner
    params.require(:user).permit(:name,:username,:gender,:email,  :city,:state,:address,:phone,:pincode,:password,:password_confirmation,:adh)
  end

  def set_params
    @user=User.find params[:id]
  end
end
