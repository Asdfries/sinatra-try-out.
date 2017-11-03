require 'sinatra'
require 'sinatra/reloader'

@@number = rand(100)
@@guess_count = 5
@@textcolor = "black"
@@backcolor = "white"

def guess_check(guessed)
  if guessed > @@number
    @@guess_count -=1
    if guessed - 5 > @@number
      @@backcolor = "red"
      @@textcolor = "yellow"
      "WAY TOO HIGH!!!"
    else
      @@backcolor = "yellow"
      @@textcolor = "blue"
      "Too High!!!"
    end
  elsif guessed < @@number && guessed > 0 
    @@guess_count -=1
    if guessed + 5 < @@number
      @@backcolor = "red"
      @@textcolor = "yellow"
      "WAY TOO LOW!!!"
    else
      @@backcolor = "yellow"
      @@textcolor = "blue"
       "Too Low!!!"
    end
  elsif guessed == @@number
    @@guess_count -=1
    @@backcolor = "green"
    @@textcolor = "black"
    "You got it right!!!"
  else
    @@guess_count = 5
    "Pick a number 0-100"
  end
end

get '/' do 
  guess = params["guess"].to_i
  message = guess_check(guess)
  erb :index, :locals => {:guess => guess, :number => @@number, :message => message, :textcolor => @@textcolor, :backcolor => @@backcolor, :guess_count => @@guess_count}
end



