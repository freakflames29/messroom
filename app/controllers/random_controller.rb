class RandomController < ApplicationController
  def new
    @random=Randomdb.new  
    @all= Randomdb.all
    @locations=@all.map(&:location)
  end

  def find
    the_hash=the_para
    @res=Randomdb.where(the_hash)
    @random=Randomdb.new
    # render plain:res

    if @res.size > 0
      flash[:succ]='record found'
    else
      flash[:fail]='record not found'
    end
    render :new
      # redirect_to random_new_path
  end
  def the_para
    params.require(:randomdb).permit(:name,:location,:price,:mtype)
  end
end
