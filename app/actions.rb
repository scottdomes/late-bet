require_relative 'goal-actions'
require_relative 'bet-actions'
require_relative 'user-actions'

helpers do
  def current_user
    session[:user]
    # User.find_by(username: "scott")
    # if session[:user_id]
    #   User.find(session[:user_id])
    # end
  end

end

before do
  session[:user] = User.find_by(username: "scott") unless session[:user]
end

enable :sessions



# Homepage (Root path)
# get '/' do
#   erb :goals
# end
get '/' do
  erb :'index'
end


get '/users/:username' do
  @user = User.find_by(username: params[:username])
  @winnings = winnings(@user)
  @debts = debts(@user)
  erb :'users/show'
end