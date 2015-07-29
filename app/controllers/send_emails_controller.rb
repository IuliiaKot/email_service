class SendEmailsController < ApplicationController

  def index
    if params[:g].nil?
      @info = "g" #= {:from => "", :to => "", :subject => "", :body => ""}

    else
      @info = "g"
      @from = params[:g][:from]
      @to = params[:g][:to]
      @subject = params[:g][:subject]
      @body = params[:g][:body]
      #SendMail.welcome(@from, @to, @subject, @body).deliver_now
      require "httparty"
      url = "https://sendgrid.com/api/mail.send.json"

      response = HTTParty.post url, :body => {
        "api_user" => ENV['SENDGRID_USERNAME'],
        "api_key" =>  ENV['SENDGRID_PASSWORD'],
        "to" => @to,
        "from" => @from,
        "subject" => @subject,
        "text" => @body
      }
      rertr
      response.body
    end
  end

  def create
    #render 'index'
    #SendMail.welcome.deliver_now
  end
end
