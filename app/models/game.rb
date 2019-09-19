class Game < ApplicationRecord
    belongs_to :match
    has_many :players, through: :matches
end
