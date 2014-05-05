class UserVerification < ActionMailer::Base
  default from: "studentconnectapp@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_verification.new_user.subject
  #
  def new_user(user)
    @user = user


    mail to: @user.email
  end
end
