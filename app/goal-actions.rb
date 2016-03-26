get '/goals' do
  # if session[:user]
  #   @goal = Goal.new
    #@recent = recent_bets
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
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Setting up logic to display past results. ~~~~~~~~~~~~~~~~~~
# def recent_bets
#   bets = Bet.most_recent(1)
#   #winner should be the winner name
#   first_name = bets.map(&:user).map(&:first_name)


#   @recent_goal_winner = get_winner(bets)
#   loser = get_loser(bets)
#   {winner: winner, loser: loser}
# end

# def goal_success_or_fail
#   if Bet.most_recent
# end

# @recent_goal_first_name + @recent_success_or_fail + @recent_goal_qty + recent_item + "from" + @recent_bettor + "by" + @recent_title  
# Maz + won + 1 + Macbook Pro + from + James + by + finish lighthouse labs

# ~~~~~~~~~~ OR ~~~~~~~
# Maz won 3 Mabook pros from James, Scott, and Paul. GOAL Success: "finish lighthouse labs"
# James, Scott, and Paul each won 1 Macbook pro from Maz. Goal Fail: "finish lighthouse labs"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ END OF logic to display past results. ~~~~~~~~~~~~~~~~~~

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
    redirect back
  else 
    cookies[:failure] = "Oops! " + @goal.errors.full_messages.join(" and ").downcase.capitalize + "!"
    redirect '/goals/#custom-goal'
  end
end

