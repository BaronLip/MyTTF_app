class Player < ApplicationRecord
    has_secure_password
    # has_secure_password :recovery_password, validations: false

    has_many :matches
    has_many :games, through: :matches
end
