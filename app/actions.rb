require_relative 'goal-actions'

enable :sessions

before do
  User.destroy_all
  Goal.destroy_all
  @scott = User.create(name: "Scott D-dog")
  5.times do
    @scott.goals << Goal.create(title: "Scott wants to finish this project!", stake_qty: 2, stake_item: "beer", deadline: Date.tomorrow)
  end
  session[:user] = @scott # TEST
end


# Homepage (Root path)
get '/' do
  erb :goals
end