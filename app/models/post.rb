class Post < ApplicationRecord
    validates :title,  presence: true
    validates :content,  presence: true
    validates :start_time, presence: true
    def self.search(keyword)
        where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
      end
end
