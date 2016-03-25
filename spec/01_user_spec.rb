require_relative 'spec_helper'

describe Goal do

  context 'validations' do

    #Another option for using with FactoryGirl. This code is not working.
    #let(:user) {build :user}

    before(:each) do
      # @user = User.new()
      # @user.assign_attributes(
      #   name: 'Shawn',
      #   email: 'kreayshawn@oaklandhiphop.net'
      # )

      @user = build :user

    end

    it 'the user to be valid' do
      expect(@user).to be_valid
    end

    it 'the user first_name to not be valid if it is empty' do
      @user.first_name = ""
      expect(@user).to_not be_valid
    end

    it 'the user last_name to not be valid if it is empty' do
      @user.last_name = ""
      expect(@user).to_not be_valid
    end

    it 'the username to not be valid if it is empty' do
      @user.username = ""
      expect(@user).to_not be_valid
    end

    it 'the user email to not be valid if it is empty' do
      @user.email = ""
      expect(@user).to_not be_valid
    end

    it 'the user email to not be valid if it is not a real email' do
      @user.email = "sdkflhdsk@kjshk"
      expect(@user).to_not be_valid
    end

  end

end