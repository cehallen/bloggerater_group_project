require 'spec_helper'

describe RegistrationConfirmation do

  before(:each) do
    ActionMailer::Base.deliveries = []
  end

  it 'sends an email when registering is successful' do 
    prev_mail_count = ActionMailer::Base.deliveries.count
    @user = FactoryGirl.create(:user)
    expect(ActionMailer::Base.deliveries.count).to eql(prev_mail_count + 1)
  end

end
