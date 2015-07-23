class SendEmailsJob < ActiveJob::Base
  queue_as :default

  def perform
    # @capsules = Capsule.all
    logger.debug "peforming email job"
    @users = User.all
    @users.each {|user|
      user.capsules.each {|capsule|
        if capsule.monthlyInterval
          logger.debug "monthly capsule: #{capsule.title}"
          if Date.today.mon - capsule.sendDate.mon >= 1
            CapsuleMailer.send_capsule(user, capsule).deliver_now
            capsule.sendDate = Date.today.next_month
            capsule.save
            logger.debug "capsule emailed: #{capsule.title}"
          end
        else
          if Date.today.year - capsule.sendDate.year >= 1
            CapsuleMailer.send_capsule(user, capsule).deliver_now
            capsule.sendDate = Date.today.next_year
            capsule.save
          end
        end

      }
    }
  end
end
