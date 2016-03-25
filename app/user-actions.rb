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