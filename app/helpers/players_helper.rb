module PlayersHelper

    def win_percentage(player)
        if player.wins == nil || player.matches.count == nil
            "No matches yet. Get started!"
        else
            player.wins.to_i / player.matches.count
        end
    end

end
