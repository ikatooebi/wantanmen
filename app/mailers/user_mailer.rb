class UserMailer < ActionMailer::Base
  default from: "webmaster@lib_admin"

  def welcome_email(user)
    @user = user
    mail(to: "akimizu@r.recruit.co.jp",
         subject: "new user created Lib_admin")
  end
end
