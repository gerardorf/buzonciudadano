class IssueMailer < ActionMailer::Base
  default :from => 'elbuzondelciudadano@gmail.com'


  def new_issue(to, user_name, uuid)
    @user = to
    @url  = 'http://localhost:3000/buzon/resumen/'+uuid
    @user_name = user_name
    mail(to: @user, subject: 'Welcome to My Awesome Site')
  end

end
