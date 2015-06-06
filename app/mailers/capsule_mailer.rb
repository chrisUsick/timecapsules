class CapsuleMailer < ActionMailer::Base
  default from: "capsule@timecapsule.com"

  def send_capsule (user, capsule)
    @user = user
    @capsule = capsule
    mail(to:@user.email, subject: 'Time Capsule')
  end
end
