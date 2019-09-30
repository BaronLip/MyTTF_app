class MatchesController < ApplicationController
    # (Not used cause of nested routes.) before_action :find_match, only:[:show, :update, :destroy]
    
    def show
        if params[:player_id]
        	@match = Player.find(params[:player_id]).matchs.find(params[:id])
        else
        	@match = Match.find(params[:id])
        end
    end    
    
    def new
        #If there is a player_id in params and the player_id does not exist in datebase, redirect to players index. 
        if params[:player_id] && !Player.exists?(params[:player_id])
            redirect_to players_path, alert: "Player not found."
        else
            @match = Match.new(player_id: params[:format])

            # Using static number of game fields:
            @match.games.build(player_id: @match.player_id)
            @match.games.build(player_id: @match.player_id)
            @match.games.build(player_id: @match.player_id)
            @match.games.build(player_id: @match.player_id)
            @match.games.build(player_id: @match.player_id)
            @match.games.build(player_id: @match.player_id)
            @match.games.build(player_id: @match.player_id)
        end
    end

    def create
        @match = Match.new(match_params)
    
        if @match.save
            redirect_to match_path(@match)
        else
            flash[:errors] = @match.errors.full_messages
            render 'new'
        end
    end

    def edit
        if params[:player_id] && !Player.exists?(params[:player_id])
            redirect_to players_path, alert: "Player not found."
        else
            find_match
        end   
    end
    
    def update
        # binding.pry
        find_match
        @match.update(match_params)
        redirect_to match_path(@match)
    end

    def destroy
        find_match
        @match.destroy
        redirect_to player_path(@match.player)
    end

    private

    def match_params
        params.require(:match).permit(
        :match_type, 
        :notes, 
        :date, 
        :player_id, 
        :opponent_id,
            games_attributes: [
                :id,
                :match_id,
                :player_id,
                :player_score,
                :opponent_id,
                :opponent_score,
            ]
        )
    end

    def find_match
        @match = Match.find_by(:id => params[:id])
    end

end
