class MatchesController < ApplicationController
    before_action :find_match, only:[:show, :edit, :update, :destroy]
    
    def new
        @match = Match.new
    end

    def create
        @match = Match.new(match_params)
    end

    def show
        
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
        params.require(:match).permit(:match_type, :notes, :date, :player_id, :opponent_id)
    end

    def find_match
        @match = Match.find_by(:id => params[:match_id])
    end

end
