class Match < ApplicationRecord
    belongs_to :player
    belongs_to :opponent
    has_many :games
end
