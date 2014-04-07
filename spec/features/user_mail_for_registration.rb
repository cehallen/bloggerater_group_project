require 'spec_helper'

feature 'enters in valid information', %q{
  As a user who registers,
  I want to recieve a confirmation email,
  So I know my email is working with the site and I can recieve notifications
} do
# AC:
# I will recieve a confirmation email when I register
context 'fills in valid registration information' do
   
    before(:each) do
      ActionMailer::Base.deliveries = []
      @user = FactoryGirl.build(:user)
    end

    it 'sends an email' do
      visit new_user_registration_path
      fill_in "Email", with: @user.email
      fill_in "Password", with: "adminqwerty"
      fill_in "Password confirmation", with: "adminqwerty"
      within "#new_user" do
        click_on "Sign up"
      end
      expect(ActionMailer::Base.deliveries.size).to eq(1)
      last_email = ActionMailer::Base.deliveries.last
      expect(last_email).to have_subject('Bloggerater Registration Confirmation')
      expect(last_email).to deliver_to(@user.email)
      expect(last_email).to have_body_text("Welcome to the Bloggerater, Find the Best Blogs, Rate and Review, and Post Blogs You'd Like to Be On the Site")
    end

  end


end
