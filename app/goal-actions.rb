get '/goals' do
  # if session[:user]
  #   @goal = Goal.new
    erb :'goals/index'
  # else
  #   cookies[:]
  #   redirect '/goals/'
  # end
end

# get '/goals/new' do
#   # if session[:user]
#   #   @goal = Goal.new
#     erb :'goals/new'
#   # else
#   #   cookies[:]
#   #   redirect '/goals/'
#   # end
# end

post '/goals' do
  @goal = Goal.new(
    title: params[:title],
    deadline: params[:deadline],
    stake_qty: params[:stake_qty],
    stake_item: params[:stake_item],
    user_id: session[:user].id
  )
  if @goal.save
    cookies[:success] = "Goal successfully created!"
    redirect '/goals'
  else 
    cookies[:failure] = "Oops! " + @goal.errors.full_messages.join(" and ").downcase.capitalize + "!"
    redirect '/goals/#custom-goal'
  end
end

