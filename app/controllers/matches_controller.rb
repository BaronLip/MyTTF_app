class MatchesController < ApplicationController
   before_action :find_match, only:[:update, :destroy]
    
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
        # binding.pry
        @match = Match.new(match_params)
        # @match = Match.find_by(:id => params(match_id))
        if @match.save
            redirect_to match_path(@match)
        else
            flash[:errors] = @match.errors.full_messages.join(", ")
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
        #before_action
        @match.update(only_match_params)
        
        @games = @match.games
        @games.each do |g|
            match_params[:games_attributes].each do |ga|
                if g.id == ga[1][:id].to_i
                    g.player_score = ga[1][:player_score].to_i
                    g.opponent_score = ga[1][:opponent_score].to_i
                    g.save
                end
            end
        end

        @games.each do |g|
            if g.player_score == 0 || g.opponent_score == 0
                g.destroy
            end
        end
        redirect_to match_path(@match)
    end

    def destroy
        #before_action
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

    def only_match_params
        params.require(:match).permit(
        :match_type, 
        :notes, 
        :date, 
        :player_id, 
        :opponent_id
        )
    end

    def find_match
        @match = Match.find_by(:id => params[:id])
    end

end
