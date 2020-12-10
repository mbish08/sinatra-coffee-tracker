class UsersController < ApplicationController


    get '/signup' do
        #get form to sign up
        erb :'users/signup'
    end

    post '/signup' do 
       user = User.create(params[:user])
       redirect to "/users/#{user.id}"
    end 

    get '/signin' do
        erb :'users/signin'
    end

    post '/signin' do
        user = User.find_by_username(params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else
            redirect to '/signin'
        end
    end 

    get '/users/:id' do 
        @user = User.find_by_id(params[:id])
        erb :'users/show'
    end 
     
end 