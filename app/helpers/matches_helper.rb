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
            if g.player_score.to_i > g.opponent_score.to_i
                player_wins += 1
            else
                opponent_wins += 1
            end
        end

        if player_wins > opponent_wins
            flash[:won] = "Congrats, you won the match!"
            "Won"
        else
            flash[:lost] = "Bummer, better luck next time!"
            "Lost"
        end
    end

    def win_percentage(player)
        if player.matches.count == 0
            "No matches yet. Get started!"
        else
            (match_wins(player).to_f / player.matches.count.to_f).round(2)
        end
    end

    def match_wins(player)
        @match_wins = 0
        @match_losses = 0
        player.matches.each do |m|
            game_wins(m)
            if @game_wins > @game_losses
                @match_wins += 1
            else
                @match_losses += 1
            end
        end
        @match_wins
    end

    def match_losses(player)
        @match_wins = 0
        @match_losses = 0
        player.matches.each do |m|
            game_wins(m)
            if @game_wins > @game_losses
                @match_wins += 1
            else
                @match_losses += 1
            end
        end
        @match_losses
    end

    def game_wins(match)
        @game_wins = 0
        @game_losses = 0
        match.games.each do |g|
            if g.player_score > g.opponent_score
                @game_wins += 1
            else
                @game_losses += 1   
            end
        end
    end
    
end