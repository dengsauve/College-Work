# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/contact_email
  def contact_email
    UserMailer.contact_email
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/restaurant_mail
  def restaurant_mail
    UserMailer.restaurant_mail
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome_mail
  def welcome_mail
    UserMailer.welcome_mail
  end

end
