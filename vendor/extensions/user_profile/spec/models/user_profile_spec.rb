require File.dirname(__FILE__) + '/../spec_helper'

describe UserProfile do
  before(:each) do
    @user_profile = UserProfile.new
  end

  it "should be valid" do
    @user_profile.should be_valid
  end
end
