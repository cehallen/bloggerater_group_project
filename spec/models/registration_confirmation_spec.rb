require 'spec_helper'

describe RegistrationConfirmation do

  it 'sends an email when registering is successful' do 
    prev_mail_count = ActionMailer::Base.deliveries.count 
    FactoryGirl.build(:user).register 
    expect(ActionMailer::Base.deliveries.count).to eql(prev_mail_count + 1)
  end

end
