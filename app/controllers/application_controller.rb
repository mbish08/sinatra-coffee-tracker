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

    def redirect_if_not_logged_in
      flash[:message] = "Please log in before continuing!"
      redirect to '/signin' if !logged_in?
    end

  end 

end
