# Preview all emails at http://localhost:3000/rails/mailers/send_mail
class SendMailPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/send_mail/welcome
  def welcome
    SendMail.welcome
  end

end
