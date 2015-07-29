class SendMail < ApplicationMailer

  def welcome(from, to, subject, body)
    @greeting = body

    mail from: from, to: to, subject: subject
  end
end
