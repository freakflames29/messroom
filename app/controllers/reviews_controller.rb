class ReviewsController < ApplicationController
  def new
  end

  def create
    @review = Review.new filter_params

    @mess = Mess.find params[:id]
    @user= current_user

    @review.user = @user 
    @review.mess = @mess
     
    if @review.save
      flash[:win] = 'You added a review !'
      redirect_to @mess
    else
      flash[:fail]='oops! there is an error !'
      redirect_to @mess
    end
  end

  def index
  end

  private
  def filter_params
    params.require(:review).permit(:body,:id)
  end
end
