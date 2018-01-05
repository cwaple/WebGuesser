require 'sinatra'
require 'sinatra/reloader'

@@guesses = 5

get '/' do
  if @@guesses == 5
    SECRET_NUMBER = rand(100)
  elsif @@guesses == 0
    @@guesses = 5
    number_message = "Sorry you lost, the secret number was #{SECRET_NUMBER}.\n Guess new Secret Number!"
    SECRET_NUMBER = rand(100)
  end  
  guess = params["guess"].to_i
  message = check_guess(guess)
  background_color = get_background_color(message)
  if guess == SECRET_NUMBER
    number_message = "You are correct! The Secret number was #{SECRET_NUMBER}! \n Guess new number!"
    @@guesses = 5
  else 
    @@guesses -= 1
  end
  erb :index, :locals => {:number_message => number_message, :message => message, :background_color => background_color}
end

def check_guess(guess)
  if guess > SECRET_NUMBER
    return "Too high!"
  elsif guess < SECRET_NUMBER
    return "Too low!"
  else
    return "Woot!"
  end
end

def get_background_color(message)
  if message == "Too high!"
    return "red"
  elsif message == "Too low!"
    return "blue"
  else
    return "white"
  end
end