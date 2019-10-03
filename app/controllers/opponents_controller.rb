class OpponentsController < ApplicationController

    def new
        @opponent = Opponent.new
    end

    def create
        @opponent = Opponent.new(opponent_params)

        if @opponent.save
            redirect_to player_path(current_player)
        else
            flash[:errors] = @opponent.errors.full_messages.join(", ")
            redirect_to new_opponent_path
        end
    end

    def edit
        @opponent = Opponent.find_by(:id => params[:opponent_id])
    end
    
    def update
        @opponent = Opponent.find_by(:id => params[:opponent_id])
        
        binding.pry
        if @opponent.update(opponent_params)
            redirect_to player_path(current_player)
        else
            flash[:errors] = @opponent.errors.full_messages.join(", ")
            redirect_to edit_opponent_path
        end
    end

    private

    def opponent_params
        params.require(:opponent).permit(:username, :ranking, :wins, :losses, :gender)
    end

end