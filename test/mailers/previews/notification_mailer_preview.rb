# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/latest_rentals
  def latest_rentals
    NotificationMailer.latest_rentals
  end

end
