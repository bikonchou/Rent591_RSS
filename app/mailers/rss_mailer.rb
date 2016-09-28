class RssMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rss_mailer.latest_objects.subject
  #
  def latest_rentals(email, rentals)
    @rentals = rentals

    mail to: "#{email}", subject: "Hey! There are #{@rentals.size} new rentals!"
  end
end
