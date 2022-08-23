class ContactMailer < ApplicationMailer
    def send_when_done(user,task)
        @user = user
        @task = task
        mail to: user.email, subject: 'タスクが完了しました。'
    end
end
