helpers do

  def stringify_bet_result(bet)
    if bet.result
      "#{bet.result[:winner].first_name} wins!"
    else
      "Unresolved!"
    end
  end

  def goal_success(goal)
    if goal.success
      "successful-goal"
    elsif goal.fail
      "failed-goal"
    end
  end

  def stringify_winnings(bet)
    "#{bet.result[:winner].first_name} won #{bet.goal.stake_qty} #{bet.goal.stake_item} from #{bet.result[:loser].first_name} when #{bet.goal.user.first_name} #{stringify_result(bet.goal)} #{bet.goal.title}!"
  end

  def stringify_debts(bet)
    "#{bet.result[:winner].first_name} lost #{bet.goal.stake_qty} #{bet.goal.stake_item} from #{bet.result[:loser].first_name} when #{bet.goal.user.first_name} #{stringify_result(bet.goal)} #{bet.goal.title}!"
  end


  def stringify_result(goal)
    if goal.success
      "did"
    else
      "failed to"
    end
  end
end


post '/goals/complete' do
  @goal = Goal.find(params[:goal_id])
  if params[:success] == "true"
    @goal.success = true
  else
    @goal.fail = true
  end

  if @goal.save
    cookies[:success] = "Goal complete!"
    redirect back
  else 
    cookies[:failure] = "Oops! " + @goal.errors.full_messages.join(" and ").downcase.capitalize + "!"
    redirect back
  end
end

post '/bets/paid' do
  @bet = Bet.find(params[:bet_id])
  @bet.paid = true

  if @bet.save
    cookies[:success] = "Bet paid!"
    redirect back
  else 
    cookies[:failure] = "Oops! " + @bet.errors.full_messages.join(" and ").downcase.capitalize + "!"
    redirect back
  end
end

post '/users/empty_notifications' do
  current_user.notifications.each do |notification|
    notification.read = true
    notification.save
  end
  
  if current_user.notifications.length > 10
    current_user.notifications = current_user.notifications[1..9]
    current_user.save
  end
end

get '/users/logout' do
  erb :'users/login'
end

post '/users/login' do
  session[:user] = User.find_by(username: params[:user])
  redirect '/goals'
end