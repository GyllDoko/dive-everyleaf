class User < ApplicationRecord
    has_secure_password
    before_validation {email.downcase!}
    validates :email, presence: true, uniqueness: true, length: {maximum: 255}, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  }
    validates :password, presence: true, length: {minimum:6}
    has_many :tasks
    # before_create do self.is_admin = true
    end

