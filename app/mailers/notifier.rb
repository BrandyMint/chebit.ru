class Notifier < ActionMailer::Base
  default :from => Settings.mail.sender

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.new_user.subject
  #
  def new_user
    @greeting = "Hi"

    mail :to => Settings.mail.receiver
  end
end
