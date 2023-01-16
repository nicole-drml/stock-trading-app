class RegistrationMailer < ApplicationMailer

  def new_pending_user(user)
    @user = user
    mail(
      to: @user.email,
      subject: "Application Received",
    )
  end
end
