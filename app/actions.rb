require_relative 'goal-actions'
require_relative 'bet-actions'
require_relative 'user-actions'

helpers do
  def current_user
    session[:user]
  end

end

before do
  session[:user] = User.find_by(username: "scott") unless session[:user]
end

enable :sessions

get '/' do
  erb :'index'
end


get '/users/:username' do
  @user = User.find_by(username: params[:username])
  erb :'users/show'
end