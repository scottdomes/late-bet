
helpers do

  def stringify_recent_winners
    if number_of_bettors > 0
      string = goal_maker_first_name + " won "
      string += recent_goal_qty.to_s + " " + recent_goal_item
      if number_of_bettors > 1
        string += " each " + "from "
      else
        string += " from "
      end
      string += bettors_first_names
    else
      string = goal_maker_first_name + " wanted to "
      string += @recent_goal.title + ". "
      string += goal_maker_first_name + " achieved this goal!"
    end
    string
  end

  #the goal makers first name
  def goal_maker_first_name
    @recent_goal = Goal.most_recent_successes(1).first
    @recent_goal.user.first_name
  end

  #the quantity of the goal
  def recent_goal_qty
    @recent_goal.stake_qty
  end

  # the recent item of the goal
  def recent_goal_item
    #item = @recent_goal.map(&:stake_item)
    @recent_goal.stake_item
  end

  def number_of_bettors
    if defined? @recent_goal.bets.count
      @recent_goal.bets.count
    else
      0
    end 
  end

  #the bettors first name
  def bettors_first_names
    @recent_goal.bets.collect {|b| b.user.first_name}.to_sentence
  end

end

get '/goals/?' do
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


post '/goals' do
  @goal = Goal.new(
    title: params[:title].gsub(/[^A-Za-z0-9\s()]/i, ''),
    deadline: params[:deadline],
    stake_qty: params[:stake_qty],
    stake_item: params[:stake_item].gsub(/[^A-Za-z0-9\s()]/i, ''),
    user_id: session[:user].id
  )
  if @goal.save
    # cookies[:success] = "Goal successfully created!"
    # redirect back
    return "Goal successfully created!"
  else 
    # cookies[:failure] = "Oops! " + @goal.errors.full_messages.join(" and ").downcase.capitalize + "!"
    # redirect '/goals/#custom-goal'
    return "Oops! " + @goal.errors.full_messages.join(" and ").downcase.capitalize + "!"
  end
end