module MatchesHelper
    
    
    def player_id_field(match)
        if match.player.nil?
            select_tag "match[player_id]", options_from_collection_for_select(Player.all, :id, :username, match.player_id) 
        else
            # Make sure to have the f.hidden_field. This carries the "id" from posts#new over and assigns it to posts#create.
            hidden_field_tag "match[player_id]", match.player_id
        end
    end
    
    def opponent_id_field(match)
        select_tag "match[opponent_id]", options_from_collection_for_select(Opponent.all, :id, :username)       
    end
    
    def match_scores(match)
        @match_scores = []
        match.games.each do |g|
            @match_scores.push(g.player_score.to_s + ":" + g.opponent_score.to_s)
        end
        @match_scores.join(", ")
    end
    
    def match_status(match)
        player_wins = 0
        opponent_wins = 0
        match.games.each do |g|
            if g.player_score > g.opponent_score
                player_wins += 1
            else
                opponent_wins += 1
            end
        end

        if player_wins > opponent_wins
            "Won"
        else
            "Lost"
        end
    end
    
end

# def game_score
#     # self.player_score.to_s + ":" + self.opponent_score.to_s
#     "#{self.player_score} : #{self.opponent_score}"
# end