class MatchesController < ApplicationController
    # (Not used cause of nested routes.) before_action :find_match, only:[:show, :edit, :update, :destroy]
    
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
            @match = Match.new(player_id: params[:player_id])
            # if using static number of game fields:
            
            @match.games.build(player_id: params[:player_id])
            @match.games.build(player_id: params[:player_id])
            @match.games.build(player_id: params[:player_id])
            @match.games.build(player_id: params[:player_id])
            @match.games.build(player_id: params[:player_id])
            @match.games.build(player_id: params[:player_id])
            @match.games.build(player_id: params[:player_id])
        end
    end

    def create
        # raise params.inspect
        @match = Match.new(match_params)
        # binding.pry
        if @match.save
            redirect_to match_path(@match)
        else
            flash[:errors] = @match.errors.full_messages
            render 'new'
        end
    end

    def edit
                
    end

    def update

    end

    # def destroy
    #     @match.destroy
    #     redirect_to player_path(@match.player_id)
    # end

    private

    def match_params
        params.require(:match).permit(
        :match_type, 
        :notes, 
        :date, 
        :player_id, 
        :opponent_id,
            games_attributes: [
                :match_id,
                :player_id,
                :player_score,
                :opponent_id,
                :opponent_score,
                :address_type]
        )
    end

    def find_match
        @match = Match.find_by(:id => params[:match_id])
    end

end
