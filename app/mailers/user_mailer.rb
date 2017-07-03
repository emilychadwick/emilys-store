class UserMailer < ApplicationMailer
  default from: "hello@emilysstore.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
      :to => 'emilyann.chadwick@gmail.com',
      :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
    @user = user
    @appname = "Emily's Store"
    mail(to: user.email,
      subject: "Welcome to #{@appname}!")

  end

end
