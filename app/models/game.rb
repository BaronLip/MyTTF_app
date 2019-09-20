class Game < ApplicationRecord
    belongs_to :match
    belongs_to :player
    belongs_to :opponent
end
