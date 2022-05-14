class WelcomeController < ApplicationController
  def index
    @messes = Mess.where city:'kolkata'
    @messes = @messes[0..2]
  end

  def search

    landmark = params[:search][:landmark]
    # price = params[:search][:price]
    city = params[:search][:city]
    # boys_or_girls = params[:search][:boys_or_girls]

    puts "YES IT IS NIL"   if landmark.nil?


    if !landmark.size.zero?   and !city.size.zero?   

      @search = Mess.where('landmark LIKE ? city LIKE  ? ','%'+landmark+'%','%'+city+'%')

    elsif !landmark.size.zero?

      @search = Mess.where('landmark LIKE ?','%'+landmark+'%')

    elsif !city.size.zero?   

      @search = Mess.where('city LIKE ?','%'+city+'%')

    else

      @search = Mess.all

    end

  end

  def show_adv_search
  end

  def advance_search
    landmark = params[:search][:landmark]
    city = params[:search][:city]
    min_price = params[:search][:min_price]
    max_price = params[:search][:max_price]
    boys_or_girls = params[:search][:boys_or_girls]

    # render plain:params[:search]

   if landmark.size.zero? || city.size.zero? || min_price.size.zero? || max_price.size.zero? || boys_or_girls.eql?('--select--')
      flash[:warn] = 'Fill the filed correctly !'

      render :show_adv_search

    else

      if boys_or_girls.eql?('service boys')
        @search = Mess.where('landmark LIKE ? and city LIKE ? and price between ? and ? and service_boys_only = 1','%'+landmark+'%','%'+city+'%',min_price,max_price)

        render 'search'

      elsif boys_or_girls.eql?('service girls')
        
        @search = Mess.where('landmark LIKE ? and city LIKE ? and price between ? and ? and service_girls_only = 1','%'+landmark+'%','%'+city+'%',min_price,max_price) 
        render 'search'

      elsif boys_or_girls.eql?('student girls')
        @search = Mess.where('landmark LIKE ? and city LIKE ? and price between ? and ? and student_girls_only = 1','%'+landmark+'%','%'+city+'%',min_price,max_price)
        render 'search'

      elsif boys_or_girls.eql?('student boys')
        @search = Mess.where('landmark LIKE ? and city LIKE ? and price between ? and ? and student_boys_only = 1','%'+landmark+'%','%'+city+'%',min_price,max_price)
        render 'search'

      end

   end

  end

end
