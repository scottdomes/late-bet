get '/goals' do
  # if session[:user]
  #   @goal = Goal.new
    erb :'goals'
  # else
  #   cookies[:]
  #   redirect '/goals/'
  # end
end

get '/goals/new' do
  # if session[:user]
  #   @goal = Goal.new
    erb :'goals/new'
  # else
  #   cookies[:]
  #   redirect '/goals/'
  # end
end