helpers do
  def stringify_bet_result(bet)
    if bet.result
      "#{bet.result[:winner].first_name} wins!"
    else
      "Unresolved!"
    end
  end


  def bet_winner(bet)
    if bet.goal.success
      User.find(bet.goal.user_id)
    else
      User.find(bet.user_id)
    end
  end

  def goal_success(goal)
    if goal.success
      "successful-goal"
    elsif goal.fail
      "failed-goal"
    end
  end

  def winnings(user)
    winnings = []
    user.bets.each do |bet|
      if bet.goal.fail
        winnings << bet
      end
    end

    user.goals.each do |goal|
      if goal.success && goal.bets
        goal.bets.each do |bet|
          winnings << bet
        end
      end
    end
    winnings
  end

  def debts(user)
    debts = []
    user.bets.each do |bet|
      if bet.goal.success == true
        debts << bet
      end
    end

    user.goals.each do |goal|
      if goal.fail && goal.bets
        goal.bets.each do |bet|
          debts << bet
        end
      end
    end
    debts
  end

  def stringify_winnings(user, bet)
    string = user.first_name + " won "
    string += bet.goal.stake_qty.to_s + " " + bet.goal.stake_item
    string += " from " + bet_loser(bet).first_name
    string += " when " + User.find(bet.goal.user_id).first_name 
    string += " " + stringify_result(bet.goal) + " at the goal \"" + User.find(bet.goal.user_id).first_name 
    string += " wants to " + bet.goal.title + "\""
    # string += " by " + bet.goal.deadline.strftime("%m:%M %p on %A, %B %e")
    string = string.gsub(/[^A-Za-z0-9\s"()]/i, '')
    string += "!"
  end

  def stringify_debts(user, bet)
    string = user.first_name + " lost "
    string += bet.goal.stake_qty.to_s + " " + bet.goal.stake_item
    string += " to " + bet_winner(bet).first_name
    string += " when " + User.find(bet.goal.user_id).first_name
    string += " " + stringify_result(bet.goal) + " at the goal \"" + User.find(bet.goal.user_id).first_name 
    string += " wants to " + bet.goal.title + "\""
    # string += " by " + bet.goal.deadline.strftime("%m:%M %p on %A, %B %e")
    string = string.gsub(/[^A-Za-z0-9\s"()]/i, '')
    string += "!"
  end



  def bet_loser(bet)
    if bet.goal.fail
      User.find(bet.goal.user_id)
    else
      User.find(bet.user_id)
    end
  end

  def stringify_result(goal)
    if goal.success
      "succeeded"
    else
      "failed"
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