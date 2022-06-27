class WelcomeController < ApplicationController
  def index
    @messes = Mess.where city:'kolkata'
    @messes = @messes.reverse[0..2]
  end

  def search

    landmark = params[:search][:landmark].downcase
    city = params[:search][:city].downcase

    # render plain:params[:search][:landmark]


      puts "************#{landmark}**********************"
      puts "************#{city}**********************"

    landmark = '' if landmark.nil?
    city   ='' if city.nil?
    # puts "CITY IS NIL" if city.size.zero?


    # if !landmark.nil? && !city.nil?
    #   @search = Mess.where('landmark  LIKE ? and city LIKE ?','%'+landmark+'%','%'+city+'%')
    # elsif !landmark.nil? && city.nil?
    #   @search = Mess.where('landmark LIKE ?','%'+landmark+'%')
    # elsif !city.nil? && landmark.nil?
    #   @search = Mess.where('city LIKE ?','%'+city+'%')
    # else
    #   @search = Mess.all
    # end

   
    @search = Mess.where('landmark LIKE ? and city LIKE ?','%'+landmark+'%','%'+city+'%')
      

  end

  def show_adv_search
  end

  def advance_search
    landmark = params[:search][:landmark].downcase
    city = params[:search][:city].downcase
    min_price = params[:search][:min_price]
    max_price = params[:search][:max_price]
    boys_or_girls = params[:search][:boys_or_girls].downcase

    # render plain:params[:search]

   if landmark.size.zero? || city.size.zero? || min_price.size.zero? || max_price.size.zero? || boys_or_girls.eql?('--select--')
      flash[:notice] = 'Fill the filed correctly !'

      render :show_adv_search

    else

      if boys_or_girls.eql?('service boys')
        if Rails.env.production? 
        @search = Mess.where('landmark LIKE ? and city LIKE ? and price between ? and ? and service_boys_only = true','%'+landmark+'%','%'+city+'%',min_price,max_price)

        render 'search'
      else
        @search = Mess.where('landmark LIKE ? and city LIKE ? and price between ? and ? and service_boys_only = 1','%'+landmark+'%','%'+city+'%',min_price,max_price)

        render 'search'
      end

      elsif boys_or_girls.eql?('service girls')
        if Rails.env.production? 
        
        @search = Mess.where('landmark LIKE ? and city LIKE ? and price between ? and ? and service_girls_only = true','%'+landmark+'%','%'+city+'%',min_price,max_price) 
        render 'search'
      else
         @search = Mess.where('landmark LIKE ? and city LIKE ? and price between ? and ? and service_girls_only = 1','%'+landmark+'%','%'+city+'%',min_price,max_price) 
        render 'search'
        end

      elsif boys_or_girls.eql?('student girls')

      if Rails.env.production? 
          @search = Mess.where('landmark LIKE ? and city LIKE ? and price between ? and ? and student_girls_only = true','%'+landmark+'%','%'+city+'%',min_price,max_price)
          render 'search'
        else
          @search = Mess.where('landmark LIKE ? and city LIKE ? and price between ? and ? and student_girls_only = 1','%'+landmark+'%','%'+city+'%',min_price,max_price)
          render 'search'
        end



      elsif boys_or_girls.eql?('student boys')
        if Rails.env.production? 
          @search = Mess.where('landmark LIKE ? and city LIKE ? and price between ? and ? and student_boys_only = true','%'+landmark+'%','%'+city+'%',min_price,max_price)
          render 'search'
        else
           @search = Mess.where('landmark LIKE ? and city LIKE ? and price between ? and ? and student_boys_only = 1','%'+landmark+'%','%'+city+'%',min_price,max_price)
          render 'search'
      end

      end

   end

  end


  def check_user_type
  end



  def about
  end

end
