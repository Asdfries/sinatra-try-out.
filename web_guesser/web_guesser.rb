require 'sinatra'
require 'sinatra/reloader'

@@number = rand(100)

def guess_check(guessed)
  if guessed > @@number
    if guessed - 5 > @@number
      "WAY TOO HIGH"
    else
      "Too High!!!"
    end
  elsif guessed < @@number && guessed > 0 
    if guessed + 5 < @@number
      "WAY TOO LOW!!!"
    else
       "Too Low!!!"
    end
  elsif guessed == @@number
    "You got it right!!!"
  else
    "Pick a number 0-100"
  end
end

get '/' do 
  guess = params["guess"].to_i
  message = guess_check(guess)
  erb :index, :locals => {:number => @@number, :message => message}
end

