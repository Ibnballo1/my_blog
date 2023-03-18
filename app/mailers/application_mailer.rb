class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
  def confirmation_instructions(user)
    @user = user
    mail(to: @user.email, subject: 'Confirmation instructions', from: 'example@example.com')
  end
end
