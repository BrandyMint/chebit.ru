Chebit::Application.config.middleware.use( ExceptionNotifier,
                                           # :email_prefix => "[Whatever] ",
                                           :sender_address => Settings.mail.sender,
                                           :exception_recipients => Settings.mail.receiver
                                           )
#end


# ebytoday::Application.configure do
#   config.middleware.use "::ExceptionNotifier",
#   :email_prefix => "[WebApp Error] ",
#   :sender_address => MAIL_CONFIG[:sender], # %{"notifier" <notifier@chebytoday.ru>},
#   :exception_recipients => MAIL_CONFIG[:recipient] #%w{danil@orionet.ru} 
# end
