module ApplicationHelper

    def current_player
        if session[:player_id]
            @current_player = Player.find_by(:id => session[:player_id])
        else
            @current_player = nil
        end
    end

    def is_logged_in?
        !!session[:player_id] = @player.id
    end

end
