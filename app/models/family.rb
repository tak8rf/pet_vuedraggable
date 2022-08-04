class Family < ApplicationRecord
    validates :name, presence: true
    has_many :pets
    has_many :users
    has_many :groups, dependent: :destroy
    has_many :groups_users, through: :groups, source: user    
end
