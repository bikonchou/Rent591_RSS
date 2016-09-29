namespace :notification do
  desc "Send latest 10 renting objects to subscribed users."
  task send: :environment do
    NotificationMailer.latest_rentals.deliver_now	
  end

end
