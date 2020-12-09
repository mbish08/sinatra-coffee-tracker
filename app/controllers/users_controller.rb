class UsersController < ApplicationController


    get '/signup' do
        #get form to sign up
        erb :'users/signup'
    end

    post '/signup' do
        
    end 
     
end 