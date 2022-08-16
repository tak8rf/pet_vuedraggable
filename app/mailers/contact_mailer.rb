class ContactMailer < ApplicationMailer
    def send_when_done(user,task)
        @user = user
        @task = task
        mail to: user.email, subject: 'タスクが完了しました。'
    end
    
    def send_at_the_time(user,task)
        @user = user
        @task = task
        mail to: user.email, subject: 'タスクの時間です。'
    end
end
