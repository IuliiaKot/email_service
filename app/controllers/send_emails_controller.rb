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
      #SendMail.welcome(@from, @to, @subject, @body).deliver_now
      # require "httparty"
      #  url = "https://sendgrid.com/api/mail.send.json"
      # #
      # response = HTTParty.post url, :body => {
      #   "api_user" => ENV['SENDGRID_USERNAME'],
      #   "api_key" =>  ENV['SENDGRID_PASSWORD'],
      #   "to" => @to,
      #   "from" => @from,
      #   "subject" => @subject,
      #   "text" => @body
      # }
      # if response["message"] != 'success'
        #  "api_user" => "key-6c33972ee3f7400fcde10f3b24fbcba5",

              # mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
              # message_params = {:from    => @from,
              #                   :to      => @to,
              #                   :subject => 'Sample Mail using Mailgun API',
              #                   :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
              # mg_client.send_message ENV['domain'], message_params

        # uri = URI.parse("https://api.mailgun.net/v3/sandbox4bd8677766bb465eb60b0bb14596b98c.mailgun.org/messages")
        #
        # data = {'to'        => @to,
        #       'from'      => @from,
        #       'subject'   => @subject,
        #       'text'      => @body}
        #
        # http = Net::HTTP.new(uri.host, uri.port)
        # http.use_ssl = true
        #
        # request = Net::HTTP::Post.new(uri.request_uri)
        # request.basic_auth("api", ENV['MAILGUN_API_KEY'])
        # request.set_form_data(data)
        # response = http.request(request)

        api = "https://api:#{ENV['MAILGUN_API_KEY']}@api.mailgun.net/v2/#{ENV['MAILGUN_DOMAIN']}"

        RestClient.post api+"/messages",
          :from => @from,
          :to => @to,
          :subject => "This is subject",
          :text => "Text body",
          :html => "<b>HTML</b> version of the body!"
      # response.body
  #  end
    end
  end

  def create
    #render 'index'
    #SendMail.welcome.deliver_now
  end
end
