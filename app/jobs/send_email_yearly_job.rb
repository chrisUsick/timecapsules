class SendEmailYearlyJob < ActiveJob::Base
  queue_as :default

  def perform
    User.all.each do |user|
      @capsules = user.capsules.where(monthlyInterval: false).find_each do |capsule|
        CapsuleMailer.send_capsule(user, capsule).deliver_now
      end
    end
  end
end
