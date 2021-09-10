# in app.rb
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require 'capybara'

class Battle < Sinatra::Base
    enable :sessions

  get '/' do
    erb :index
  end

  get '/attack' do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    erb :attack
  end
 
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


  run! if app_file == $0
end
