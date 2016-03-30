post '/goals/bets' do
  @bet = Bet.new(
    goal_id: params[:goal_id],
    user_id: session[:user].id
  )
  if @bet.save
    json :data => { success: true, message: "Goal successfully created!" }
  else 
    json :data => { success: false, message: "Oops! " + @bet.errors.full_messages.join(" and ").downcase.capitalize + "!" }
  end
end