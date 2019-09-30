class SessionsController < ApplicationController
    
    def new
    end

    def create
        @player = Player.find_by_email(params[:email])
		
		if @player && @player.authenticate(params[:password])
			session[:player_id] = @player.id
			redirect_to player_path(@player), notice: "Logged in!" #DOUBLE CHECK REDIRECT LOCATION.
		else
			flash.now[:alert] = "Email or password is invalid"
			render "new" #DOUBLE CHECK REDIRECT LOCATION.
		end
    end

    def destroy
        # session[:player_id] = nil
        session.delete :player_id
        redirect_to root_url, notice: "Logged out!"
    end
end
