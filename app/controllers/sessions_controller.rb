class SessionsController < ApplicationController
    
    def new
    end

    def create
        if auth_hash # Logged in through OAuth
            oauth_nickname = auth_hash[:info][:nickname].downcase
            # Since GitHub doesn't want to give me an email value, this creates Player by using "nickname" instead. The email & password is generated with the nickname value.
            if @player = Player.find_by(:username => oauth_nickname)
                session[:player_id] = @player.id # Logs player in.
                redirect_to player_path(@player), notice: "Logged in!"
            else
                @player = Player.new(:email => "#{oauth_nickname} @ #{oauth_nickname}.com", :gender => "Male", :password => oauth_nickname, :username => oauth_nickname, :ranking => 1000)
                if @player.save
                    session[:player_id] = @player.id # Logs player in.
                    redirect_to player_path(@player), notice: "Logged in!"
                else
                    flash[:errors] = @player.errors.full_messages.inspect
                    render "new"
                end
            end
            
            # This is standard finding a user through their email.
            # if player = Player.find_by(:email => oauth_email)
            #     session[:player_id] = player.id # Log player in.
            #     redirect_to player_path(player), notice: "Logged in!"
            # else
            #     player = Player.new(:email => oauth_email, :gender => "Male", :password => SecureRandom.hex, :username => auth_hash[:info][:nickname], :ranking => 1000)
            #     if player.save
            #         session[:player_id] = player.id # Log player in.
            #         redirect_to player_path(player), notice: "Logged in!"
            #     else
            #         raise player.errors.full_messages.inspect
            #     end
            # end
        else
            # Standard login process
            @player = Player.find_by_email(params[:email])
            
            if @player && @player.authenticate(params[:password])
                session[:player_id] = @player.id
                redirect_to player_path(@player), notice: "Logged in!"
            else
                flash.now[:alert] = "Email or password is invalid"
                render "new"
            end
        end
    end

    def destroy
        # session[:player_id] = nil
        session.delete :player_id
        redirect_to root_url, notice: "Logged out!"
    end

    protected

    def auth_hash
        request.env['omniauth.auth']
    end

end
