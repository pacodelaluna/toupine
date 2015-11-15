# https://github.com/smartinez87/exception_notification

if Rails.env.staging? || Rails.env.production?
  Rails.application.config.middleware.use ExceptionNotification::Rack,
  :email => {
    :email_prefix => "[Toupine #{Rails.env}] ",
    :sender_address => %{"Toupine Error Notifier" <error@toupine.com>},
    :exception_recipients => %w{plaisir@odevie.org error@kokali.net}
  }
end