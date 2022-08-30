class Pet < ApplicationRecord
    validates :name, presence: true
    validates :content,  presence: true
    has_many :posts
    belongs_to :family
    mount_uploader :image, ImageUploader
end
