require_relative 'goal-actions'
require_relative 'bet-actions'

enable :sessions

before do
  # @scott = User.create(username: "scottdomes", first_name: "Scott", last_name: "Domes", email: "scott@scott.com")
  # Bet.destroy_all
  # 5.times do
  #   Goal.create(user_id: @scott.id, title: "to finish this project!", stake_qty: 2, stake_item: "beer", deadline: Date.tomorrow)
  # end
  # @scott.goals.each { |goal| goal.bets << Bet.create(user_id: 166)}
  # session[:user] = @scott # TEST
end


# Homepage (Root path)
get '/' do
  @goals = Goal.all
  erb :'goals/index'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end