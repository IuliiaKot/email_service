require 'mailgun'
require "net/https"
require "uri"
require 'rest-client'
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

       url = "https://sendgrid.com/api/mail.send.json"
      response = HTTParty.post url, :body => {
        "api_user" => ENV['SENDGRID_USERNAME'],
        "api_key" =>  ENV['SENDGRID_PASSWORD'],
        "to" => @to,
        "from" => @from,
        "subject" => @subject,
        "text" => @body
      }
      if response["message"] != 'success'
        api = "https://api:#{ENV['MAILGUN_API_KEY']}@api.mailgun.net/v2/#{ENV['MAILGUN_DOMAIN']}"

        RestClient.post api+"/messages",
          :from => @from,
          :to => @to,
          :subject => "This is subject",
          :text => "Text body",
          :html => "<b>HTML</b> version of the body!"
    end
    end
  end

  def create
    #render 'index'
    #SendMail.welcome.deliver_now
  end
end
