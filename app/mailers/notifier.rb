class Notifier < ActionMailer::Base
  default Settings.mail.symbolize_keys

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.new_user.subject
  #
  def notify_admin_about_newbie(user)
    @user = user
    mail
  end

  def new_comment(comment)
    @comment = comment
    mail
  end
end
