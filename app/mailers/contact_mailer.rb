class ContactMailer < ApplicationMailer
  def picture_mail(current_user)
    @user = User.find_by(id: current_user.id)
    @content = "create picture success"
    mail to: @user.email, subject: "create picture success"
  end
end
