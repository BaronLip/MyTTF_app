class OpponentsController < ApplicationController

    def new
        @opponent = Opponent.new
    end

    def create
        @opponent = Opponent.new(opponent_params)

        if @opponent.save
            redirect_to player_path(@player)
        else
            flash.now[:errors][:full_messages]
            render "new"
        end
    end

    private

    def opponent_params
        params.require(:opponent).permit(:username, :ranking, :wins, :losses, :gender)
    end

end