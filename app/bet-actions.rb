post '/goals/bets' do
  @bet = Bet.create(
    goal_id: params[:goal_id],
    user_id: session[:user].id
  )
  if @bet
    json :data => { success: true, message: "Bet successfully created!" }
  else 
    json :data => { success: false, message: "Oops! " + @bet.errors.full_messages.join(" and ").downcase.capitalize + "!" }
  end
end