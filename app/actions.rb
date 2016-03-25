require_relative 'goal-actions'
require_relative 'bet-actions'
require_relative 'user-actions'

helpers do
  def current_user
    User.find_by(username: "scott")
    # if session[:user_id]
    #   User.find(session[:user_id])
    # end
  end

end

enable :sessions

before do
  # @scott = User.create(username: "scottdomes", first_name: "Scott", last_name: "Domes", email: "scott@scott.com")
  # Bet.destroy_all
  # 5.times do
  #   Goal.create(user_id: @scott.id, title: "to finish this project!", stake_qty: 2, stake_item: "beer", deadline: Date.tomorrow)
  # end
  # @scott.goals.each { |goal| goal.bets << Bet.create(user_id: 166)}
  # session[:user] = @scott # TEST
  # session[:user] =.id
  # @current_user = session[:user]
end


# Homepage (Root path)
get '/' do
  erb :'goals/index'
end

get '/index' do
  erb :'index'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end