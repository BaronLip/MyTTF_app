class Player < ApplicationRecord
    has_many :matches
    has_many :games, through: :matches
    
    has_secure_password
    # has_secure_password :recovery_password, validations: false
    
    validates :password, presence: true, on: :create
    validates_presence_of :username, :email, :ranking, :gender
    validates_uniqueness_of :username, :email
end
