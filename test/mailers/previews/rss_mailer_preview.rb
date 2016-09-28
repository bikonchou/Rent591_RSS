# Preview all emails at http://localhost:3000/rails/mailers/rss_mailer
class RssMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/rss_mailer/latest_objects
  def latest_objects
    RssMailer.latest_objects
  end

end
