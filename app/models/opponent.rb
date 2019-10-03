class Opponent < ApplicationRecord
    has_many :matches
    has_many :games, through: :matches

    validates_presence_of :username, :gender, :ranking
    validates :username, uniqueness: true
end
