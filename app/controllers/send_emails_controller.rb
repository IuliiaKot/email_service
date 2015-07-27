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
      SendMail.welcome(@from, @to, @subject, @body).deliver_now
      k
    end
  end

  def create
    sds
    #render 'index'
    #SendMail.welcome.deliver_now
  end
end
