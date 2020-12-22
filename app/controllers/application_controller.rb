require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
    register Sinatra::Flash
  end

  get '/' do
    erb :welcome
  end 

  helpers do 

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end 

    def current_coffee
      @coffee ||= Coffee.find_by(id: params[:id])
    end 

    def not_your_coffee
      if current_coffee == nil || current_coffee.user_id != current_user.id
          flash[:alert] = "The coffee you selected does not exist or does not belong to you.  Please choose from your list of coffees or create a new one."
          redirect to "/users/#{current_user.id}"
      end 
    end 

    def redirect_if_not_logged_in
      flash[:message] = "You are not logged in or the page you requested does not belong to you.  Please log out to continue as a different user."
      redirect to '/signin' if !logged_in?
    end

    def check_for_current_user_else_redirect
      if current_user.id != params[:id].to_i
        flash[:message] = "This page does not belong to you.  Please logout and login as another user to view this page."
        redirect to "/users/#{current_user.id}"
      else 
        current_user.coffees
        erb :'users/show'
      end 
    end 

  end 

end