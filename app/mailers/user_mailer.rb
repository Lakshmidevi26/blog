class UserMailer < ApplicationMailer

    def sign_up_mail(user)
        @user = user
        mail(to: @user.email,subject: "Sign up process completed")
    end    

end
