class CoffeesController < ApplicationController

    get '/coffees' do
        #get all the coffees
        @coffees = Coffee.all
        erb :'/coffees/index'
    end 

    get '/coffees/new' do
        #get the form to create a new coffee
        @user = User.find_by_id(session[:user_id])
      #  binding.pry
        erb :'/coffees/new'
    end 

    post '/coffees' do 
        #submit the form and create a coffee and redirect
        coffee = Coffee.new(params[:coffee])
        coffee[:user_id] = session[:user_id]
        user = User.find_by_id(session[:user_id])
        # binding.pry
        coffee.save
        
        redirect to "/users/#{user.id}"
    end 

    # get '/coffees/home' do
    #     @user = User.find_by_id(session[:user_id])
    #     @coffees = @user.coffees
    #     erb :'coffees/home'
    # end 

    get '/coffees/:id' do
        #show one coffee
        ##NEED TO CODE IN AN IF/ELSE FOR IF FOUND DO X, ELSE DO Y - IF ID ISN'T FOUND IT WILL RETURN 'NIL'
        @coffee = Coffee.find_by(id: params[:id])
        erb :'coffees/show'
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
        coffee = Coffee.find_by_id(params[:id])
        coffee.destroy
        redirect to :'coffees'
    end 

end 