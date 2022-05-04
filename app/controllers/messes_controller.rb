class MessesController < ApplicationController
  before_action :require_user,only:[:new,:create]
  
  def index
    @messes=Mess.all
  end

  def new
    @mess=Mess.new
  end


  def create
    @mess=Mess.new filter_params
    @mess.user_id = current_user.id
    if @mess.valid?

      if @mess.save
        redirect_to @mess
      else
        render plain:'Not saved'
      end

      else
        render plain:'You fucked it up'
    end
  end

  def update
  end

  def show
    @mess=Mess.find params[:id]
  end

  def destroy
  end

  private
  def filter_params

      params.require(:mess).permit(:title,:description,:price,:adrs,:city,:state,:landmark,:pincode,:service_boys_only,:service_girls_only,:student_boys_only,:student_girls_only,:for_all,:room_available,images:[])
  end
end
