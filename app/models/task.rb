class Task < ApplicationRecord
    validates :title,  presence: true
    validates :content,  presence: true
    validates :start_time, presence: true
end
