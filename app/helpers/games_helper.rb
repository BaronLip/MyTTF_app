module GamesHelper

    def game_score
        self.player_score.to_s + ":" + self.opponent_score.to_s
    end

end
