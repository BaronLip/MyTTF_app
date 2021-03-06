class OpponentsController < ApplicationController

    def new
        @opponent = Opponent.new
        @opponents = Opponent.all
    end

    def create
        @opponent = Opponent.new(opponent_params)

        if @opponent.save
            flash[:success] = "Opponent created successfully!"
            redirect_to player_path(current_player)
        else
            flash[:errors] = @opponent.errors.full_messages.join(", ")
            redirect_to new_opponent_path
        end
    end

    def edit
        @opponent = Opponent.find_by(:id => params[:id])
    end
    
    def update
        @opponent = Opponent.find_by(:id => params[:id])

        if @opponent.update(opponent_params)
            redirect_to player_path(current_player)
        else
            flash[:errors] = @opponent.errors.full_messages.join(", ")
            redirect_to edit_opponent_path
        end
    end

    #
    # def mnames
    #     @opponents = Opponent.all
    # end

    private

    def opponent_params
        params.require(:opponent).permit(:username, :ranking, :wins, :losses, :gender)
    end

end