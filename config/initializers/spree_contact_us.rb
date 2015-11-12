# Use this initializer to configure the contact mailer.

SpreeContactUs.setup do |config|

  # ==> Mailer Configuration

  # Configure the e-mail address which email notifications should be sent from.  If emails must be sent from a verified email address you may set it here.
  # Example:
  # config.mailer_from = "contact@please-change-me.com"
  config.mailer_from = nil

  # Configure the e-mail address which should receive the contact form email notifications.
<<<<<<< HEAD
  config.mailer_to = "plaisir@odevie.org"
=======
  config.mailer_to = "contact@please-change-me.com"
>>>>>>> 89f68e97c8f5d5a0d8cf6300f3ff8cccd5a0b06f

  # ==> Form Configuration

  # Configure the form to ask for the users name.
  config.require_name = false

  # Configure the form to ask for a subject.
  config.require_subject = false

end
