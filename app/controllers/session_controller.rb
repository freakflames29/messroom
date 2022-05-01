class SessionController < ApplicationController
  before_action :redirect_if_loggedin ,except:[:destroy]
  def new
  end

  def create
    @user=User.find_by email:params[:session][:email]
    @owner=Owner.find_by email:params[:session][:email]

    if @user && @user.authenticate(params[:session][:password])

        flash[:ok] ='You are logged in!'
        redirect_to @user
        session[:user_id]=@user.id

    elsif @owner && @owner.authenticate(params[:session][:password])
        flash[:ok] ='You are logged in!'
        redirect_to @owner
        session[:user_id]=@owner.id

    else
        flash.now[:fail]='Wrong crendentials!'
        render :new
      
    end


  end

  def destroy
    session[:user_id]=nil
    redirect_to signup_path
  end
end
