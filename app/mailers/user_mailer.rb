class UserMailer < ActionMailer::Base
  default :from => "oliverderafera@gmail.com"
  
  def registration_confirmation(user)
    mail(:to => user.name, :subject => "Registered")
  end
end