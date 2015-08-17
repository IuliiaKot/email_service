require 'mailgun'
require "net/https"
require "uri"
require 'rest-client'
class SendEmailsController < ApplicationController
  validate :from_s
  def index
    if params[:information].nil?
       @info = "information" #= {:from => "", :to => "", :subject => "", :body => ""}
    else
      @info = "information"
      @from = params[:information][:from]
      @to = params[:information][:to].gsub(" ", "").split(",")
      @subject = params[:information][:subject]
      @body = params[:information][:body]

      url = "https://sendgrid.com/api/mail.send.json"
      response = HTTParty.post url, :body => {
        "api_user" => ENV['SENDGRID_USERNAME'],
        "api_key" =>  ENV['SENDGRID_PASSWORD'],
        "to" => @to,
        "from" => @from,
        "subject" => @subject,
        "text" => @body,
      }
      if response["message"] != 'success'
        api = "https://api:#{ENV['MAILGUN_API_KEY']}@api.mailgun.net/v2/#{ENV['MAILGUN_DOMAIN']}/messages"

        response = HTTParty.post api, :body => {
          "to" => @to,
          "from" => @from,
          "subject" => @subject,
          "text" => @body
        }
      end
      if response["message"] == 'success'
         flash[:success] = "Your email has been sent"
      else
        flash[:error] = "Sorry, you email has not benn sent"
      end
    end
  end


  def from_s
    
  end
  def create
    #render 'index'
    #SendMail.welcome.deliver_now
  end

end
