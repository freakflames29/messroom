class RandomController < ApplicationController
  def new
    @random=Randomdb.new  
  end

  def find
    render plain:params
  end
end
