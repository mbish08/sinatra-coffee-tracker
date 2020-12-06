class CoffeesController < ApplicationController

    get '/coffees' do
        #get all the coffees
        erb :'/coffees/index'
    end 

    get '/coffees/new' do
        #get the form to create a new coffee
        erb :'/coffees/new'
    end 

    # post '/coffees' do 
    #     #submit the form and create a coffee and redirect
    #     erb :coffees
    # end 

    # get '/coffees/:id' do
    #     #show one coffee

    # end 

    # get '/coffees/:id/edit' do
    #     #get the form to edit one coffee

    # end 

    # patch '/coffees/:id' do 
    #     #update/modify the existing coffee in the database

    # end 

    # delete '/coffees/:id' do
    #     #delete a single coffee 

    # end 

end 