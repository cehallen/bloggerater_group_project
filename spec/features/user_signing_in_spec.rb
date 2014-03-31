require 'spec_helper'

feature 'viewer trying to sign in', %q{
  As a registered user
  I can sign in when I navigate to the site
  So I can actually do stuff
  } do

  # AC:
  # I have to enter in a email
  # I have to enter in a password
  # What happens when you're not signed in?

  context 'filling out user information' do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it 'it signs you in when you give valid entries' do
      visit new_user_session_path
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password
      within "#new_user" do
        click_on "Sign in"
      end

      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_content('Sign Out')
    end

    it "gives you an error message when you don't give it an email" do
      visit new_user_session_path
      fill_in "Email", with: ""
      fill_in "Password", with: @user.password
      within "#new_user" do
        click_on "Sign in"
      end

      expect(page).to have_content("Invalid email or password")
    end

    it "gives you an error message when you don't give it an password" do
      visit new_user_session_path
      fill_in "Email", with: @user.email
      fill_in "Password", with: ""
      within "#new_user" do
        click_on "Sign in"
      end

      expect(page).to have_content("Invalid email or password")
    end

    it "gives you an error when you enter in incorrect password" do
      visit new_user_session_path
      fill_in "Email", with: @user.email
      fill_in "Password", with: "asfaslkfjaslfjklasdjfljaskljf;adsflajfl"
      within "#new_user" do
        click_on "Sign in"
      end

      expect(page).to have_content("Invalid email or password")
    end

    it "gives you an error when you enter in unregistered email" do
      visit new_user_session_path
      fill_in "Email", with: "iamnotregistered@iamnotregistered.com"
      fill_in "Password", with: @user.password
      within "#new_user" do
        click_on "Sign in"
      end

      expect(page).to have_content("Invalid email or password")
    end

  end

end
