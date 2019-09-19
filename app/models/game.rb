class Game < ApplicationRecord
    belongs_to :match
    belongs_to :player
    # has_many :players, through: :match
end
