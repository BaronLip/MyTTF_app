class Player < ApplicationRecord
    has_many :matches
    has_many :games, through: :matches
    
    has_secure_password
    # has_secure_password :recovery_password, validations: false
    
    validates_presence_of :username, :email, :ranking, :gender, :password
    validates_uniqueness_of :username, :email
end
