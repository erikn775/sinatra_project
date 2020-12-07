require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'super_secret_string'
  end

  get "/" do
    erb :welcome
  end

  get '/error' do
    erb :error
  end

  helpers do
    #gives access inside of view files
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end
