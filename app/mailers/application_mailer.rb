class ApplicationMailer < ActionMailer::Base
  default to: -> { User.pluck(:email) },
          from: "danf1024@gmail.com"
  layout "mailer"
end
