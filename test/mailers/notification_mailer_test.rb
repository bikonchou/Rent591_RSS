require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  test "latest_rentals" do
    mail = NotificationMailer.latest_rentals
    assert_equal "Latest rentals", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
