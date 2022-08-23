class Task < ApplicationRecord
    validates :title,  presence: true
    validates :content,  presence: true
    validates :start_time, presence: true
  
    def self.today_tasks
      today_tasks = []
      Task.all.each do |task|
        if task.start_time.strftime("%Y-%m-%d") == Date.today.strftime("%Y-%m-%d")
          today_tasks << task
        end
      end
      today_tasks
    end

    belongs_to :pet

    def self.remind
      tasks = Task.where(mailer:false)
      tasks.each do |task|
        if task.start_time < Time.now
          TodoMailer.send_at_the_time(task.pet.family.users,task).deliver
          task.mailer = true
          task.save
        end
      end
    end
end
