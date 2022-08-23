class TodoMailer < ApplicationMailer
    def send_at_the_time(users,task)
        @users = users
        @task = task
        @users.each do |user|
            @user = user
            mail to: @user.email, subject: 'タスクの時間です。'
        end
    end
end
