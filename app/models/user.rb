class User < ActiveRecord::Base
    has_many :cars
    has_secure_password
    validates :name, presence: true
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true
end