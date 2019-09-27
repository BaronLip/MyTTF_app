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

    # def games_per_match(match)
        
    # end
    
    def match_status(match)
    #     if m.user_score.to_i > m.opponent_score.to_i
    #         Win
    #     elsif
    #         m.user_score.to_i < m.opponent_score.to_i
    #         Lose
    #     end
    end

    def match_scores(match)
        # @match_scores = []
        # match.games.each do |g|
        #     @match_scores.push(g.game_score)
        # end
        # @match_scores
    end
end
