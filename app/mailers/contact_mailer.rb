class ContactMailer < ApplicationMailer
  def picture_mail(current_user)
    @user = User.find_by(id: current_user.id)
    @content = "おめでとうございます。#{@user.name}さんのPictureの作成が完了しました。shielded-meadow-22931.herokuapp.com"
    mail to: @user.email, subject: "Pictureの作成が完了しました。"
  end
end
