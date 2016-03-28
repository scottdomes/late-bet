post '/goals/bets' do
  @bet = Bet.new(
    goal_id: params[:goal_id],
    user_id: session[:user].id
  )
  if @bet.save
    # cookies[:success] = "Bet successfully added!"
    "Bet successfully added!"
    # redirect '/goals'
  else 
    # cookies[:failure] = "Oops! " + @bet.errors.full_messages.join(" and ").downcase.capitalize + "!"
    # redirect '/goals'
    "Oops! " + @bet.errors.full_messages.join(" and ").downcase.capitalize + "!"
  end
end