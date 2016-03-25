require_relative 'goal-actions'
require_relative 'bet-actions'

enable :sessions

before do
  # User.destroy_all
  # Goal.destroy_all
  @scott = User.create(username: "scottdomes", first_name: "Scott", last_name: "Domes")
  # @scott = User.find_by(name: "Scott D-dog")
  # Bet.destroy_all
  # 5.times do
  #   @scott.goals << Goal.create(title: "Scott wants to finish this project!", stake_qty: 2, stake_item: "beer", deadline: Date.tomorrow)
  # end
  # @scott.goals.each { |goal| goal.bets << Bet.create(user_id: 166)}
  session[:user] = @scott # TEST
end


# Homepage (Root path)
get '/' do
  erb :goals
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end