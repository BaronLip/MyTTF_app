class Match < ApplicationRecord
    belongs_to :player
    has_many :games
end
