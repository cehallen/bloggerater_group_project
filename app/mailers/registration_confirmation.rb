class RegistrationConfirmation < ActionMailer::Base
  default from: "bloggeration@bloggerater.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registraion_confirmation.receipt.subject
  #
  def receipt(user)
    @message = "Welcome to the Bloggerater, Find the Best Blogs, Rate and Review, and Post Blogs You'd Like to Be On the Site"

    mail to: user.email,
      subject: 'Bloggerater Registration Confirmation'
  end
end
