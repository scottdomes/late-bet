helpers do
  def stringify_bet(user, bet)
    string = user.first_name + " bet " + User.find(bet.goal.user_id).first_name + " " + bet.goal.stake_qty.to_s + " " + bet.goal.stake_item + " that " + User.find(bet.goal.user_id).first_name + " would " + bet.goal.title + " by " + bet.goal.deadline.strftime("%m:%M %p on %A, %B %e") + "!"
    string.gsub(/[^A-Za-z0-9\s]/i, '')
  end

  def bet_winner(bet)
    if bet.goal.success
      User.find(bet.goal.user_id).first_name + " wins!"
    elsif bet.goal.fail
      bet.user.first_name + " wins!"
    else
      "Unresolved!"
    end
  end

  def goal_success(goal)
    if goal.success
      "successful-goal"
    elsif goal.fail
      "failed-goal"
    else
      nil
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