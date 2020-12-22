class CoffeesController < ApplicationController

    get '/coffees' do
        #get all the coffees
        if !logged_in?
            redirect to '/'
        else
            @coffees = Coffee.all
            erb :'/coffees/index'
        end
    end 

    get '/coffees/new' do
        #get the form to create a new coffee
        if !logged_in?
            redirect to '/'
        else
            # @user = User.find_by_id(session[:user_id])
            erb :'/coffees/new'
        end
    end 

    post '/coffees' do 
        #submit the form and create a coffee and redirect
        coffee = current_user.coffees.build(params[:coffee])
        if current_user.coffees.find_by_flavor(coffee[:flavor])
            flash[:alert] = "The coffee you just entered already exists.  If you would like to edit your coffee, please select it from the list above."
            redirect to "/users/#{current_user.id}"
        else
            coffee.save
            redirect to "/users/#{current_user.id}"
        end 
    end 

    get '/coffees/:id' do
        #show one coffee
        @coffee = Coffee.find_by(id: params[:id])
        user = User.find_by_id(session[:user_id])
        # binding.pry
        if @coffee == nil
            redirect to "/users/#{user.id}"
        else
            erb :'coffees/show'
        end 
    end 

    get '/coffees/:id/edit' do
        #get the form to edit one coffee
        @coffee = Coffee.find_by_id(params[:id])
        erb :'coffees/edit'
    end 

    patch '/coffees/:id' do 
        #update/modify the existing coffee in the database
        coffee = Coffee.find_by_id(params[:id])
        coffee.update(params[:coffee])
        redirect to "/coffees/#{coffee.id}"
    end 

    delete '/coffees/:id' do
        #delete a single coffee 
        user = User.find_by_id(session[:user_id])
        coffee = Coffee.find_by_id(params[:id])
        coffee.destroy
        redirect to :"/users/#{user.id}"
    end 

end