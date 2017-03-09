class StaticPagesController < ApplicationController

  def index
  end

  def landing_page
    @products = Product.limit(3)
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
      :to => 'emilyann.chadwick@gmail.com',
      :subject => "A new contact form message from #{@name}",
      :body => @message).deliver_now
  end

end
