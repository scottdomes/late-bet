require_relative 'goal-actions'

enable :sessions

# Homepage (Root path)
get '/' do
  # session[:user] = User.create(name: "Scott Domes")
  erb :goals
end