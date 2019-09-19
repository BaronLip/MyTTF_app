class Player < ApplicationRecord
    has_many :matches
    has_many :games, through: :matches
end
