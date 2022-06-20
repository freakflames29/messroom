class MessesController < ApplicationController
  before_action :check_owner_profile, only: %i[new create update]
  before_action :require_user,only:[:show_number]
  before_action :check_user_is_the_uploader ,only:[:edit, :destroy]

  def index
    @messes = Mess.all.order('created_at DESC')
  end

  def new
    @mess = Mess.new
  end

  def create
    @mess = Mess.new filter_params
    @mess.user_id = current_user.id
    puts "------------------------------_____________________$#{@mess.images.size}$-------"
    if @mess.valid?

      if @mess.images.size > 6
        flash[:fail] = 'You can only upload 5 images'
        render :new
      elsif @mess.save
        redirect_to @mess
      else
        render plain: 'Error occured'
      end

    else
      render :new
    end
  end


  def edit
    # check_user_is_the_uploader
    @mess=Mess.find params[:id]
  end

  def update

    @mess=Mess.find params[:id]
    if @mess.update(filter_params)
      flash[:win]='Mess updated !'
      redirect_to @mess
    else
      render :edit
    end 
  end

  def show
    @mess = Mess.find params[:id]

    @review=Review.new

    @all_reviews = @mess.reviews.all.reverse
  end

  def show_number 
    @mess=Mess.find params[:id]
    @mess_owner=@mess.user
    render :show
    # redirect_to @mess

  end




  def destroy

        @mess=Mess.find params[:id]
        if @mess.destroy
          flash[:notice]="'#{@mess.title}' deleted !"
          redirect_to messes_path
        end

  end

  private

  def filter_params
    params.require(:mess).permit(:title, :description, :price, :adrs, :city, :state, :landmark, :pincode, :service_boys_only,
                                 :service_girls_only, :student_boys_only, :student_girls_only, :for_all, :room_available, images: [])
  end


  def check_user_is_the_uploader
    @mess=Mess.find params[:id]

    if !@mess.user.eql?(current_user) and !admin_user
      flash[:fail]="You can't perform this action"
      redirect_to @mess
    end


  end
end
