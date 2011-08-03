class Notifier < ActionMailer::Base
  default( Settings.mail)

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.new_user.subject
  #
  def notify_admin_about_newbie(user)
    @user = user
    mail
  end
end
