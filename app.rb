# in app.rb
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require 'capybara'


class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

    enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

get '/play' do
  @player_1_name = $player_1.name
  @player_2_name = $player_2.name
  erb :play
end

get '/attack' do
  @player_1 = $player_1
  @player_2 = $player_2
  Game.new.attack(@player_2)
  erb :attack
end

  run! if app_file == $0
end
