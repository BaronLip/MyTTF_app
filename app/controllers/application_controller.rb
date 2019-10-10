class ApplicationController < ActionController::Base

    def welcome
        render '/applications/welcome'
    end

    def current_player
        if session[:player_id]
            @current_player = Player.find_by(:id => session[:player_id])
        else
            @current_player = nil
        end
    end

    def is_logged_in?
        binding.pry
        !!session[:player_id] = @player.id
    end
    
end
