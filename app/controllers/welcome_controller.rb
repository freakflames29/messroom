class WelcomeController < ApplicationController
  def index

  end

  def search

    # puts 
    
    if !params[:search][:city].nil? and !params[:search][:landmark].nil? and !params[:search][:price].nil? and !params[:search][:boys_or_girls].eql?('--select--')

      if params[:search][:boys_or_girls].eql?('for boys')

          @search = Mess.where('landmark LIKE ? and city LIKE ? and price = ? and (service_boys_only = 1 or student_boys_only = 1)','%'+params[:search][:landmark]+'%','%'+params[:search][:city]+'%',params[:search][:price])

      elsif params[:search][:boys_or_girls].eql?('for girls')

          @search = Mess.where('landmark LIKE ? and city LIKE ? and price = ? and (service_girls_only = 1 or student_girls_only = 1)','%'+params[:search][:landmark]+'%','%'+params[:search][:city]+'%',params[:search][:price])

      elsif params[:search][:boys_or_girls].eql?('for all')

          @search = Mess.where('landmark LIKE ? and city LIKE ? and price = ? and for_all = 1','%'+params[:search][:landmark]+'%','%'+params[:search][:city]+'%',params[:search][:price])


      end

       # @search = Mess.where('landmark LIKE ? and city LIKE ? and price = ?','%'+params[:search][:landmark]+'%','%'+params[:search][:city]+'%','%'+params[:search][:price]+'%')
     
     elsif !params[:search][:city].nil? and !params[:search][:landmark].nil? and !params[:search][:price].nil? and params[:search][:boys_or_girls].eql?('--select--')

       @search = Mess.where('landmark LIKE ? and city LIKE ? and price = ?','%'+params[:search][:landmark]+'%','%'+params[:search][:city]+'%',params[:search][:price])

     elsif !params[:search][:city].nil? and !params[:search][:landmark].nil?
         @search = Mess.where('landmark LIKE ? and city LIKE ? ','%'+params[:search][:landmark]+'%','%'+params[:search][:city]+'%')

      elsif !params[:search][:city].nil?
         @search = Mess.where('city LIKE ? ','%'+params[:search][:city]+'%')

      elsif  !params[:search][:landmark].nil?
         @search = Mess.where('landmark LIKE ? ','%'+params[:search][:landmark]+'%')

      else

        @search= Mess.all




    end

    # render plain:params
  end
end
