# in app.rb

require 'sinatra/base'
require 'sinatra/reloader'

class Battle < Sinatra::Base
    enable :sessions

  get '/' do
    erb :index
  end

 # in app.rb

  post '/names' do
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    redirect '/play'
  end
  
  get '/play' do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    erb :play
  end

# in app.rb

get '/attack' do
  @player_1_name = session[:player_1_name]
  @player_2_name = session[:player_2_name]
  erb :attack
end


  run! if app_file == $0
end
