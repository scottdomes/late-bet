
helpers do

  def stringify_recent_winners
    goal = Goal.most_recent_successes(1).first
    if number_of_bettors > 0
      string = goal.user.first_name + " won "
      string += goal.stake_qty.to_s + " " + goal.stake_item
      if number_of_bettors > 1
        string += " each " + "from "
      else
        string += " from "
      end
      string += bettors_first_names
    else
      string = goal.user.first_name + " wanted to "
      string += goal.title + ". "
      string += goal.user.first_name + " achieved this goal!"
    end
    string
  end

  def number_of_bettors
    if defined? @recent_goal.bets.count
      @recent_goal.bets.count
    else
      0
    end 
  end

  def bettors_first_names
    # Gets all the bettors names
    @recent_goal.bets.collect {|b| b.user.first_name}.to_sentence
  end

end

get '/goals/?' do
    erb :'goals/index'
end

post '/goals' do
  @goal = Goal.new(
    title: params[:title].gsub(/[^A-Za-z0-9\s()]/i, ''),
    deadline: params[:deadline],
    stake_qty: params[:stake_qty],
    stake_item: params[:stake_item].gsub(/[^A-Za-z0-9\s()]/i, ''),
    user_id: session[:user].id
  )
  if @goal.save
    json :data => { success: true, message:  "Goal successfully created!" }
  else 
    json :data => { success: false, message: "Oops! " + @goal.errors.full_messages.join(" and ").downcase.capitalize + "!" }
  end
end