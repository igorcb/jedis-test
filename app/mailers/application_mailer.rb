class ApplicationMailer < ActionMailer::Base
  default from: 'jedis@test.com'
  layout 'mailer'

  def welcome(municipe)
    @municipe = municipe
    mail(to: @municipe.email, subject: 'Welcome to Jedis Proj')
  end
end
