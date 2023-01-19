class RegistrationMailer < ApplicationMailer

  def application_received(user)
    @user = user
    mail(
      to: @user.email,
      subject: "Application Received",
    )
  end

    def account_created(user)
      @user = user
      mail(
        to: @user.email,
        subject: "Account Created",
      )
    end

    def new_pending_user(user, current_user)
      @user = user
      @current_user = current_user
      @buzz_email = 'admin@buzz.com'
      mail(
        to: @buzz_email,
        subject: "New Pending Trader",
      )
    end
end
