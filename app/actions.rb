require_relative 'goal-actions'

enable :sessions

# Homepage (Root path)
get '/' do
  erb :index
end