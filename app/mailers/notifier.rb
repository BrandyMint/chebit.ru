class Notifier < ActionMailer::Base
  default( :from => Settings.mail.sender,
           :return_path => Settings.mail.return_path,
           :to => Settings.mail.admin_email
           )

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
