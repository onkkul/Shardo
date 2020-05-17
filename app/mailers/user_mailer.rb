class UserMailer < ApplicationMailer
  default from: 'sharedofood@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.post_notification.subject
  #
  
  def post_notification(user)
    @user = user
    @greeting = "Hi "+ @user.firstname
    mail to: @user.email, subject: "New notification"
  end
end
