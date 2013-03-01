require 'spec_helper'

describe User do

  subject(:user) { User.create(:email => 'nobody@nobody.com', :password => 'abcdefghijk') }

  it "should only send one email during creation" do
    expect {
      user
    }.to change(ActionMailer::Base.deliveries, :count).by(1)
  end

  it "should set attribute in after_create as expected" do
    user.status.should eq(200)
  end

end
