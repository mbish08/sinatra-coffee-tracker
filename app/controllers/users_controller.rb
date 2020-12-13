class UsersController < ApplicationController


    get '/signup' do
        #get form to sign up
        erb :'users/signup'
    end

    post '/signup' do 
        user = User.new(params[:user])
        # binding.pry
        if user.save
            # user.save
            session[:user_id] = user.id
            user.save
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
    #    binding.pry
        @user = current_user
        if !logged_in?
            redirect to '/'
        else
            @coffees = @user.coffees
            erb :'users/show'
        end
        # @user = User.find_by_id(params[:id])
        # #current_user = session[:user_id]
        # @coffees = @user.coffees
        # if @user.id == current_user
        #     erb :'users/show'
        # else
        #     redirect to '/'
        # end 
    end 

    get '/logout' do
        session.clear
        redirect to '/'
    end 
     
end 