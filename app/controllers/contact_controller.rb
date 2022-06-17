class ContactController < ApplicationController

  before_action :can_access,only:[:show]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new (set_params)
    if @contact.save
      flash[:win]='Your message send successfully !'
      redirect_to contact_path
    else
      flash[:fail]='Fill correctly'
      render :new
    end
  end

  def show
    @msgs=Contact.all.order('created_at DESC')
  end

  private
  def set_params
    params.require(:contact).permit(:name,:body,:email,:title)
  end

  def can_access
    user_allowed=[5]
    if !user_allowed.include?(current_user.id)
      flash[:fail]='Not allowed to see !'
      redirect_to root_path
    end
  end
end
