# helpers do
#   def stringify_winnings(user, bet)
#     string = user.first_name + " won "
#     string += bet.goal.stake_qty.to_s + " " + bet.goal.stake_item
#     string += " from " + bet_loser(bet).first_name
#     string += " when " + User.find(bet.goal.user_id).first_name 
#     string += " " + stringify_result(bet.goal) + " at the goal \"" + User.find(bet.goal.user_id).first_name 
#     string += " wants to " + bet.goal.title + "\""
#     # string += " by " + bet.goal.deadline.strftime("%m:%M %p on %A, %B %e")
#     string = string.gsub(/[^A-Za-z0-9\s"()]/i, '')
#     string += "!"
#   end
# end

# get '/goals' do
#   # if session[:user]
#   #   @goal = Goal.new
#     #@recent = recent_bets
#     erb :'goals/index'
#   # else
#   #   cookies[:]
#   #   redirect '/goals/'
#   # end
# end

# # get '/goals/new' do
# #   # if session[:user]
# #   #   @goal = Goal.new
# #     erb :'goals/new'
# #   # else
# #   #   cookies[:]
# #   #   redirect '/goals/'
# #   # end
# # end
# # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Setting up logic to display past results. ~~~~~~~~~~~~~~~~~~
# @recent_goal = Goal.most_recent_successes(1)

# def recent_goals
#   goals = Goal.most_recent_successes(1)
#   #winner should be the winner name
#   # first_name = goals.map(&:user).map(&:first_name)
#   first_name = goals.map(&:user)
#   # update = goals.map(&:updated_at)
#   # sentence = "{first_name)"
#   #puts first_name

#   # @recent_goal_winner = get_winner(bets)
#   # loser = get_loser(bets)
#   # {winner: winner, loser: loser}
# end

# def goal_maker_first_name
#   goal_user_first_name = @recent_goal.map(&:user).map(&:first_name)
# end
  
# # testing for first name of better
# def test1
#   #better_first_name = @recent_goal.map(&:user).map(&:bet).map(&:first_name)
#   #better_first_name = @recent_goal.map(&:user).map(&:bets) #not quite
#   better_first_name = @recent_goal.map(&:bets).map(&:user).map(&:first_name) #not quite #
  
# end

# post '/goals' do
#   @goal = Goal.new(
#     title: params[:title],
#     deadline: params[:deadline],
#     stake_qty: params[:stake_qty],
#     stake_item: params[:stake_item],
#     user_id: session[:user].id
#   )
#   if @goal.save
#     cookies[:success] = "Goal successfully created!"
#     redirect back
#   else 
#     cookies[:failure] = "Oops! " + @goal.errors.full_messages.join(" and ").downcase.capitalize + "!"
#     redirect '/goals/#custom-goal'
#   end
# end