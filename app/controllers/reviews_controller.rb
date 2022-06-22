class ReviewsController < ApplicationController
  before_action :check_review_user_validity,only:[:destroy]
  def new
  end

  def create
    @review = Review.new filter_params

    @mess = Mess.find params[:id]
    @user= current_user

    @review.user = @user 
    @review.mess = @mess
     
    if @review.save
      flash[:win] = 'Review added!'
      redirect_to @mess
    else
      flash[:fail]='oops! there is an error !'
      redirect_to @mess
    end
  end

  def index
  end


  def destroy 
    @r=Review.find params[:id]
    x=@r
    if @r.destroy
      flash[:win]='Review deleted!'
      redirect_to mess_path(x.mess)
    end
  end

  private
  def filter_params
    params.require(:review).permit(:body,:id)
  end

  def check_review_user_validity
      @r=Review.find params[:id]
      if !@r.user.eql?(current_user)
        flash[:fail]='You can not delete this review'
      end
  end
end
