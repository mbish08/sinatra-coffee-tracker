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
        if current_coffee == nil || current_coffee.user_id != current_user.id
            flash[:alert] = "The coffee you selected does not exist or does not belong to you.  Please choose from your list of coffees or create a new one."
            redirect to "/users/#{current_user.id}"
        else
            erb :'coffees/show'
        end 
    end 

    get '/coffees/:id/edit' do
        #get the form to edit one coffee
        erb :'coffees/edit'
    end 

    patch '/coffees/:id' do 
        #update/modify the existing coffee in the database
        current_coffee.update(params[:coffee])
        redirect to "/coffees/#{current_coffee.id}"
    end 

    delete '/coffees/:id' do
        #delete a single coffee 
        current_coffee.destroy
        flash[:alert] = "Your coffee has been removed from your list"
        redirect to :"/users/#{current_user.id}"
    end 

end