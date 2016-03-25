require_relative 'spec_helper'
require_relative 'spec_helper'

describe Goal do
  # before(:all) do
  #   raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:users)
  # end

  context 'validations' do


    before(:each) do
      
      @user = build :user

      @goal = Goal.new
      @goal.assign_attributes(
        user_id: @user.id,
        title: 'Run 10k',
        stake_item: "Beer",
        stake_qty: 10,
        deadline: Time.now + 10.days
      )
    end

    it 'the goal to be valid' do
      expect(@goal).to be_valid
    end

    it 'the goal title to not be valid if it is empty' do
      @goal.title = ""
      expect(@goal).to_not be_valid
    end

    it 'the stake_item to not be valid if it is empty' do
      @goal.stake_item = ""
      expect(@goal).to_not be_valid
    end

    it 'the stake_qty to not be valid if it is 0' do
      @goal.stake_qty = 0
      expect(@goal).to_not be_valid
    end

    it 'the stake_qty to not be valid if it is not a number' do
      @goal.stake_qty = "three"
      expect(@goal).to_not be_valid
    end

    it 'the deadline to not be valid if it is before today' do
      @goal.deadline = Time.now - 2.days
      expect(@goal).to_not be_valid
    end

    # it "shouldn't accept invalid emails" do
    #   ['XYZ!bitnet', '@.', 'a@b.c'].each do |address|
    #     @teacher.assign_attributes(email: address)
    #     expect(@teacher).to_not be_valid
    #   end
    # end

    # it 'should accept valid emails' do
    #   ['joe@example.com', 'info@bbc.co.uk', 'bugs@facebook.com'].each do |address|
    #     @teacher.assign_attributes(email: address)
    #     expect(@teacher).to be_valid
    #   end
    # end

    # it "shouldn't allow two students with the same email" do
    #   Teacher.create!(
    #     email: @teacher.email,
    #     phone: @teacher.phone
    #   )
    #   expect(@teacher).to_not be_valid
    # end
  end
end