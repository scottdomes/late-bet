# helpers do

#   def stringify_recent_winners
#     string = goal_maker_first_name + " won "
#     string += recent_goal_qty.to_s + " " + recent_goal_item
#     if number_of_bettors > 1
#       string += " each " + "from "
#     else
#       string += "from "
#     end
#     string += bettors_first_names
#   end

#   def goal_maker_first_name
#     @recent_goal = Goal.most_recent_successes(1).first
#     #goal_user_first_name = @recent_goal.map(&:user).map(&:first_name)
#     @recent_goal.user.first_name
#   end

#   #the quantity of the goal
#   def recent_goal_qty
#     @recent_goal.stake_qty
#   end

#   # the recent item of the goal
#   def recent_goal_item
#     #item = @recent_goal.map(&:stake_item)
#     @recent_goal.stake_item
#   end

#   def number_of_bettors
#     @recent_goal.bets.count
#   end

#   def bettors_first_names
#     # Gets the first better name
#     # @recent_goal.bets.first.user.first_name

#     # Goes through each bet and display the better name
#     # @recent_goal.bets.each do |bet|
#     #   puts bet.user.first_name
#     # end

#     # Gets all the bettors names
#     @recent_goal.bets.collect {|b| b.user.first_name}.to_sentence
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