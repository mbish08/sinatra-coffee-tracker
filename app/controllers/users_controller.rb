class UsersController < ApplicationController

    get '/signup' do
        #get form to sign up
        erb :'users/signup'
    end

    post '/signup' do 
        user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else 
            @errors = user.errors.full_messages
            erb :'users/signup'
        end 
    end 

    get '/signin' do
        erb :'users/signin'
    end

    post '/signin' do 
        !params[:user][:username].blank? ? user = User.find_by_username(params[:user][:username]) : user = User.find_by_email(params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else 
            flash[:message] = "Login unsuccessful. Please try again."
            redirect to '/signin'
        end
    end 

    get '/users/:id' do 
        if !logged_in?
            redirect_if_not_logged_in
        else
            check_for_current_user_else_redirect
        end
    end 

    get '/logout' do
        session.clear
        redirect to '/'
    end 
     
end 