class CoffeesController < ApplicationController

    get '/coffees' do
        #get all the coffees
        @coffees = Coffee.all
        erb :'/coffees/index'
    end 

    get '/coffees/new' do
        #get the form to create a new coffee
        erb :'/coffees/new'
    end 

    post '/coffees' do 
        #submit the form and create a coffee and redirect
        coffee = Coffee.create(params[:coffee])
        
        redirect to "/coffees/#{coffee.id}"
    end 

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