class PlayersController < ApplicationController
    before_action :find_player, only: [:show, :edit, :update, :destroy]
    before_action :require_login
    
    def index
        @players = Player.all
    end

    def show
        # before_action
        @match_scores = []
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

    def edit
        #before_action
    end

    def update
        #before_action
        @player.update(player_params)
        redirect_to player_path(@player)
    end

    def destroy
    end
    
    private

    def require_login
        return head(:forbidden) unless session.include? :player_id
    end

    def player_params
        params.require(:player).permit(
            :username, 
            :email, 
            :ranking, 
            :wins, 
            :losses, 
            :password,
            :gender
        )
    end

    def find_player
        @player = Player.find_by(:id => params[:id])
    end
end
