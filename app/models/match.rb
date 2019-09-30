class Match < ApplicationRecord
    belongs_to :player
    belongs_to :opponent
    has_many :games
    accepts_nested_attributes_for :games, allow_destroy: true

    def games_attributes=(games_attributes)
        games_attributes.values.each do |game_attributes|
            
            #Second attempt:
            game = Game.find_or_create_by(game_attributes) unless game_attributes[:player_score].blank? || game_attributes[:opponent_score].blank?
            # binding.pry
            # self.games << game

            #First attempt:
            # self.games.build(game_attributes) unless game_attributes[:player_score].blank? || game_attributes[:opponent_score].blank?
        end
    end
end
