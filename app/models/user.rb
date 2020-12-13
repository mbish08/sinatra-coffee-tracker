class User < ActiveRecord::Base 
    has_secure_password
    validates :password, length: {minimum: 6}, allow_blank: false
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true
    has_many :coffees
end 