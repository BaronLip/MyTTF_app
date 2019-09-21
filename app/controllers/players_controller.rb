class PlayersController < ApplicationController
    before_action :find_player

    def index
        @players = Player.all
    end

    def new
        @player = Player.new
    end

    def create
        @player = Player.new(player_params)
        
        if @player.save
			session[:player_id] = @player.id
			flash[:success] = "Signup complete"
			redirect_to player_path(@player)
		else
			flash[:errors] = @player.errors.full_messages.join(", ")
			redirect_to new_player_path
		end	
        
    end
    
    def show
        @player = Player.find_by(:id => params[:id])
    end
    
    private
    
    def player_params
        # binding.pry
        params.require(:player).permit(
            :username, 
            :email, 
            :ranking, 
            :wins, 
            :losses, 
            :password
        )
    end

    def find_player
        @player = Player.find_by(:id => params[:id])
    end
end
