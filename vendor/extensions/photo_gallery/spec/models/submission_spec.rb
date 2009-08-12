require File.dirname(__FILE__) + '/../spec_helper'

describe Submission do
  before(:each) do
    @submission = Submission.new
  end

  it "should be valid" do
    @submission.should be_valid
  end
end
