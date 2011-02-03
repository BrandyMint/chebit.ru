Chebit::Application.config.middleware.use( ExceptionNotifier,
                                           :email_prefix => "[CHEBiT] ",
                                           :sender_address => Settings.mail.sender,
                                           :exception_recipients => Settings.mail.admin_email
                                           ) if Rails.env.production?

# puts '=============='

Chebit::Application.configure do
  config.action_mailer.default_url_options = { :host => 'chebit.ru' }
end
# puts Chebit::Application.config.action_mailer.default_url_options = { :host => Settings.host }
