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
        subject: "Welcome to Buzz",
      )
    end

    def new_pending_user(user)
      @user = user
      @buzz_email = 'admin@buzz.com'
      mail(
        to: @buzz_email,
        subject: "New Pending Trader",
      )
    end

    def application_approved(user, current_user)
      @user = user
      @current_user_email = current_user.email
      mail(
        from: @current_user_email,
        to: @user.email,
        subject: "Application Approved",
      )
    end
end
