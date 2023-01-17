class RegistrationMailer < ApplicationMailer

  def application_received(user)
    @user = user
    mail(
      to: @user.email,
      subject: "Application Received",
    )
  end
end
