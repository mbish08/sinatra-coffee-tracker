class CoffeesController < ApplicationController

    get '/coffees' do
        #get all the coffees
        redirect_if_not_logged_in
        @coffees = Coffee.all
        erb :'/coffees/index'
    end 

    get '/coffees/new' do
        #get the form to create a new coffee
        redirect_if_not_logged_in
        erb :'/coffees/new'
    end 

    post '/coffees' do 
        #submit the form and create a coffee and redirect
        redirect_if_not_logged_in
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
        redirect_if_not_logged_in
        not_your_coffee
        erb :'coffees/show'
    end 

    get '/coffees/:id/edit' do
        #get the form to edit one coffee
        redirect_if_not_logged_in
        not_your_coffee
        erb :'coffees/edit'
    end 

    patch '/coffees/:id' do 
        #update/modify the existing coffee in the database
        redirect_if_not_logged_in
        not_your_coffee
        current_coffee.update(params[:coffee])
        redirect to "/coffees/#{current_coffee.id}"
    end 

    delete '/coffees/:id' do
        #delete a single coffee 
        redirect_if_not_logged_in
        not_your_coffee
        current_coffee.destroy
        flash[:alert] = "Your coffee has been removed from your list"
        redirect to :"/users/#{current_user.id}"
    end 

end