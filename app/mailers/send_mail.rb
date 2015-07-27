class SendMail < ApplicationMailer
  #default from: "kotlenko.julia@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.send_mail.welcome.subject
  #
  def welcome(from, to, subject, body)
    @greeting = body

    mail from: from, to: to, subject: subject
  end
end
