class MatchesController < ApplicationController
    include MatchesHelper

    before_action :find_match, only:[:update, :destroy]
    
    def show
        if params[:player_id]
        	@match = Player.find(params[:player_id]).matches.find(params[:id])
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
        @match = Match.new(match_params)

        @match.games.each do |g|
            g.opponent_id = @match.opponent_id
        end

        if @match.save
            flash[:success] = "Match added successfully!"
            redirect_to match_path(@match)
        else
            flash[:errors] = @match.errors.full_messages.join(", ")
            redirect_to new_player_match_path(@match.player_id)
        end

        update_wins_and_losses(@match)

        update_ranking(@match)
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
        #Lines 54-77 is one big work around but it works well.
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

    def update_wins_and_losses(match)
        @game_wins = 0
        @game_losses = 0
        
        match.games.each do |g|
            if g.player_score > g.opponent_score
                @game_wins += 1
            else
                @game_losses += 1   
            end
        end

        @player = match.player
        @opponent = match.opponent

        if @game_wins > @game_losses
            @player.wins += 1
            @opponent.losses += 1
        else
            @opponent.wins += 1
            @player.losses += 1
        end
        @player.save
        @opponent.save       
    end

    def update_ranking(match)
        @player = match.player
        @opponent = match.opponent

        if @player.matches.count == 0
            @player.ranking
        else
            if match_status(match) == "Won"
                if @player.ranking < @opponent.ranking
                    if (@opponent.ranking - @player.ranking).between?(0, 12)
                        @player.ranking += 8
                        @opponent.ranking -= 8               
                    elsif
                        (@opponent.ranking - @player.ranking).between?(13, 37)
                        @player.ranking += 10
                        @opponent.ranking -= 10
                    elsif
                        (@opponent.ranking - @player.ranking).between?(19, 62)
                        @player.ranking += 13
                        @opponent.ranking -= 13
                    elsif
                        (@opponent.ranking - @player.ranking).between?(63, 87)
                        @player.ranking += 16
                        @opponent.ranking -= 16
                    elsif
                        (@opponent.ranking - @player.ranking).between?(88, 112)
                        @player.ranking += 20
                        @opponent.ranking -= 20
                    elsif
                        (@opponent.ranking - @player.ranking).between?(113, 137)
                        @player.ranking += 25
                        @opponent.ranking -= 25
                    elsif
                        (@opponent.ranking - @player.ranking).between?(138, 162)
                        @player.ranking += 30
                        @opponent.ranking -= 30
                    elsif
                        (@opponent.ranking - @player.ranking).between?(163, 187)
                        @player.ranking += 35
                        @opponent.ranking -= 35
                    elsif
                        (@opponent.ranking - @player.ranking).between?(188, 212)
                        @player.ranking += 40
                        @opponent.ranking -= 40
                    elsif
                        (@opponent.ranking - @player.ranking).between?(213, 237)
                        @player.ranking += 45
                        @opponent.ranking -= 45
                    elsif
                        (@opponent.ranking - @player.ranking) >= 238
                        @player.ranking += 50
                        @opponent.ranking -= 50
                    end
                    @player.save
                    @opponent.save
                elsif
                    @player.ranking > @opponent.ranking
                    if (@player.ranking - @opponent.ranking).between?(0, 12)
                        @player.ranking += 8
                        @opponent.ranking -= 8
                    elsif
                        (@player.ranking - @opponent.ranking).between?(13, 37)
                        @player.ranking += 7
                        @opponent.ranking -= 7
                    elsif
                        (@player.ranking - @opponent.ranking).between?(19, 62)
                        @player.ranking += 6
                        @opponent.ranking -= 6
                    elsif
                        (@player.ranking - @opponent.ranking).between?(63, 87)
                        @player.ranking += 5
                        @opponent.ranking -= 5
                    elsif
                        (@player.ranking - @opponent.ranking).between?(88, 112)
                        @player.ranking += 4
                        @opponent.ranking -= 4
                    elsif
                        (@player.ranking - @opponent.ranking).between?(113, 137)
                        @player.ranking += 3
                        @opponent.ranking -= 3
                    elsif
                        (@player.ranking - @opponent.ranking).between?(138, 187)
                        @player.ranking += 2
                        @opponent.ranking -= 2
                    elsif
                        (@player.ranking - @opponent.ranking).between?(188, 237)
                        @player.ranking += 1
                        @opponent.ranking -= 1
                    elsif
                        (@player.ranking - @opponent.ranking) >= 238
                        @player.ranking += 0
                        @opponent.ranking -= 0
                    end
                    @player.save
                    @opponent.save
                end
            elsif match_status(@player.matches.last) == "Lost"
                if @player.ranking < @opponent.ranking
                    if (@opponent.ranking - @player.ranking).between?(0, 12)
                        @opponent.ranking += 8
                        @player.ranking -= 8
                    elsif
                        (@opponent.ranking - @player.ranking).between?(13, 37)
                        @opponent.ranking += 7
                        @player.ranking -= 7
                    elsif
                        (@opponent.ranking - @player.ranking).between?(19, 62)
                        @opponent.ranking += 6
                        @player.ranking -= 6
                    elsif
                        (@opponent.ranking - @player.ranking).between?(63, 87)
                        @opponent.ranking += 5
                        @player.ranking -= 5
                    elsif
                        (@opponent.ranking - @player.ranking).between?(88, 112)
                        @opponent.ranking += 4
                        @player.ranking -= 4
                    elsif
                        (@opponent.ranking - @player.ranking).between?(113, 137)
                        @opponent.ranking += 3
                        @player.ranking -= 3
                    elsif
                        (@opponent.ranking - @player.ranking).between?(138, 187)
                        @opponent.ranking += 2
                        @player.ranking -= 2
                    elsif
                        (@opponent.ranking - @player.ranking).between?(188, 237)
                        @opponent.ranking += 1
                        @player.ranking -= 1
                    elsif
                        (@opponent.ranking - @player.ranking) >= 238
                        @opponent.ranking += 0
                        @player.ranking -= 0
                    end
                    @player.save
                    @opponent.save                
                elsif
                    @player.ranking > @opponent.ranking
                    if (@player.ranking - @opponent.ranking).between?(0, 12)
                        @opponent.ranking += 8
                        @player.ranking -= 8
                    elsif
                        (@player.ranking - @opponent.ranking).between?(13, 37)
                        @opponent.ranking += 10
                        @player.ranking -= 10
                    elsif
                        (@player.ranking - @opponent.ranking).between?(19, 62)
                        @opponent.ranking += 13
                        @player.ranking -= 13
                    elsif
                        (@player.ranking - @opponent.ranking).between?(63, 87)
                        @opponent.ranking += 16
                        @player.ranking -= 16
                    elsif
                        (@player.ranking - @opponent.ranking).between?(88, 112)
                        @opponent.ranking += 20
                        @player.ranking -= 20
                    elsif
                        (@player.ranking - @opponent.ranking).between?(113, 137)
                        @opponent.ranking += 25
                        @player.ranking -= 25
                    elsif
                        (@player.ranking - @opponent.ranking).between?(138, 162)
                        @opponent.ranking += 30
                        @player.ranking -= 30
                    elsif
                        (@player.ranking - @opponent.ranking).between?(163, 187)
                        @opponent.ranking += 35
                        @player.ranking -= 35
                    elsif
                        (@player.ranking - @opponent.ranking).between?(188, 212)
                        @opponent.ranking += 40
                        @player.ranking -= 40
                    elsif
                        (@player.ranking - @opponent.ranking).between?(213, 237)
                        @opponent.ranking += 45
                        @player.ranking -= 45
                    elsif
                        (@player.ranking - @opponent.ranking) >= 238
                        @opponent.ranking += 50
                        @player.ranking -= 50
                    end
                    @player.save
                    @opponent.save
                end
            end
        end
        @player
        @opponent
    end

end
