class UsersController < ApplicationController


    get '/signup' do
        #get form to sign up
        erb :'users/signup'
    end

    post '/signup' do
       binding.pry 
       user = User.create(params[:user])
       redirect to "/users/#{user.id}"
    end 

    get '/users/:id' do 
        @user = User.find_by_id(params[:id])
        erb :'users/show'
    end 
     
end 