class CoffeesController < ApplicationController

    get '/coffees' do
        #get all the coffees
        erb :'/coffees/index'
    end 

    get '/coffees/new' do
        #get the form to create a new coffee
        erb :'/coffees/new'
    end 

    post '/coffees' do 
        #submit the form and create a coffee and redirect
        @coffees = Coffee.all
        redirect to :'coffees/index'
    end 

    # get '/coffees/:id' do
    #     #show one coffee
    #     ##NEED TO CODE IN AN IF/ELSE FOR IF FOUND DO X, ELSE DO Y - IF ID ISN'T FOUND IT WILL RETURN 'NIL'
    #     @coffee = Coffee.find_by(id: params[:id])
    #     erb :'movies/show'
    # end 

    # get '/coffees/:id/edit' do
    #     #get the form to edit one coffee
    #     @coffee = Coffee.find_by_id(params[:id])
    #     erb :'coffees/edit'
    # end 

    # patch '/coffees/:id' do 
    #     #update/modify the existing coffee in the database
    #     movie = Movie.find_by_id(params[:id])
    #     movie.update(params)
    #     redirect to :'movies/index'
    # end 

    delete '/coffees/:id' do
        #delete a single coffee 
        movie = Movie.find_by_id(params[:id])
        movie.destroy
        redirect to :'moveis/index'
    end 

end 