class Player < ApplicationRecord
    has_secure_password
    # has_secure_password :recovery_password, validations: false

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :ranking, presence: true
    validates :gender, presence: true

    has_many :matches
    has_many :games, through: :matches
end
