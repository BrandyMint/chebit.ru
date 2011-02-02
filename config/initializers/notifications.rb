Chebit::Application.config.middleware.use( ExceptionNotifier,
                                           :email_prefix => "[CHEBiT] ",
                                           :sender_address => Settings.mail.sender,
                                           :exception_recipients => Settings.mail.admin_email
                                           )
