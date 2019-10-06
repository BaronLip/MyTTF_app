class Opponent < ApplicationRecord
    has_many :matches
    has_many :games, through: :matches

    validates_presence_of :username, :gender, :ranking
    validates :username, uniqueness: true

    scope :pro, -> {where("ranking >= 2300")}
    scope :elite, -> {where("ranking >= 1900 AND ranking <= 2299")}
    scope :competitor, -> {where("ranking >= 1400 AND ranking <= 1899")}
    scope :amateur, -> {where("ranking <= 1399")}
end
