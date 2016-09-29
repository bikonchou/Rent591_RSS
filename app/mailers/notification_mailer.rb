class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.latest_rentals.subject
  #
  def latest_rentals
    email = 'bikonchou@gmail.com'
    @rentals = LatestRentals.new.call

    if @rentals.present?
      mail to: "#{email}", subject: "Hey! There are #{@rentals.size} new rentals!" 
      puts "##{Time.now} => [Success] Send Mail to #{email} with #{@rentals.size} new rentals."
    else
      puts "##{Time.now} => [Nothing to do] There aren't new rentals."
    end
  end
end
