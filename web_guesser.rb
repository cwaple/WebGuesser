require 'sinatra'
require 'sinatra/reloader'

get '/' do
  SECRET_NUMBER = rand(100)
  guess = params["guess"].to_i
  message = check_guess(guess)
  number = SECRET_NUMBER
  erb :index, :locals => {:number => number, :message => message}
end

def check_guess(guess)
  if guess > SECRET_NUMBER
    return "Too high!"
  elsif guess < SECRET_NUMBER
    return "Too low!"
  else
    return "You guessed it correctly!"
  end
end