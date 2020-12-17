class Car < ActiveRecord::Base
    belongs_to :user
    validates :year, presence: true
    validates :make, presence: true
    validates :model, presence: true
    validates :color, presence: true
    validates :transmission, presence: true
    validates :body_style, presence: true
end
