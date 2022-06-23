class RatingsController < ApplicationController
  def create
    @user = current_user
    @mess = Mess.find params[:id]

    @check_rated = Rating.find_by user: @user, mess: @mess
    if @check_rated

    if @check_rated.update(filter_params)
        flash[:win] = 'Rating updated' 
        redirect_to @mess
    end


    else

      @rate = Rating.new(filter_params)

      @rate.user = @user
      @rate.mess = @mess

      if @rate.save
        flash[:win] = 'Rating successfull'
        redirect_to mess_path(@mess)
      else
        flash[:fail] = 'Rating failed successfull'
        redirect_to mess_path(@mess)

      end
    end
    # render plain:@mess.inspect
  end

  def test
    render plain:params
  end

  private

  def filter_params
    params.require(:rating).permit(:rating)
  end
end
