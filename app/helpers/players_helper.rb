module PlayersHelper

    def ranking_update(player)
        if player.matches.count == 0
            player.ranking
        else
            @player_ranking = player.ranking
            @opponent_ranking = player.matches.last.opponent.ranking
            if match_status(player.matches.last) == "Won"
                if @player_ranking < @opponent_ranking
           
                    if (@opponent_ranking - @player_ranking).between?(0, 12)
                        @player_ranking += 8
                        @opponent_ranking -= 8
               
                    elsif
                        (@opponent_ranking - @player_ranking).between?(13, 37)
                        @player_ranking += 10
                        @opponent_ranking -= 10
                    elsif
                        (@opponent_ranking - @player_ranking).between?(19, 62)
                        @player_ranking += 13
                        @opponent_ranking -= 13
                    elsif
                        (@opponent_ranking - @player_ranking).between?(63, 87)
                        @player_ranking += 16
                        @opponent_ranking -= 16
                    elsif
                        (@opponent_ranking - @player_ranking).between?(88, 112)
                        @player_ranking += 20
                        @opponent_ranking -= 20
                    elsif
                        (@opponent_ranking - @player_ranking).between?(113, 137)
                        @player_ranking += 25
                        @opponent_ranking -= 25
                    elsif
                        (@opponent_ranking - @player_ranking).between?(138, 162)
                        @player_ranking += 30
                        @opponent_ranking -= 30
                    elsif
                        (@opponent_ranking - @player_ranking).between?(163, 187)
                        @player_ranking += 35
                        @opponent_ranking -= 35
                    elsif
                        (@opponent_ranking - @player_ranking).between?(188, 212)
                        @player_ranking += 40
                        @opponent_ranking -= 40
                    elsif
                        (@opponent_ranking - @player_ranking).between?(213, 237)
                        @player_ranking += 45
                        @opponent_ranking -= 45
                    elsif
                        (@opponent_ranking - @player_ranking).between?(238, 250)
                        @player_ranking += 50
                        @opponent_ranking -= 50
                    end
                    player.save
                    player.matches.last.opponent.save
                elsif
                    @player_ranking > @opponent_ranking
                    if (@player_ranking - @opponent_ranking).between?(0, 12)
                        @player_ranking += 8
                        @opponent_ranking -= 8
                    elsif
                        (@player_ranking - @opponent_ranking).between?(13, 37)
                        @player_ranking += 7
                        @opponent_ranking -= 7
                    elsif
                        (@player_ranking - @opponent_ranking).between?(19, 62)
                        @player_ranking += 6
                        @opponent_ranking -= 6
                    elsif
                        (@player_ranking - @opponent_ranking).between?(63, 87)
                        @player_ranking += 5
                        @opponent_ranking -= 5
                    elsif
                        (@player_ranking - @opponent_ranking).between?(88, 112)
                        @player_ranking += 4
                        @opponent_ranking -= 4
                    elsif
                        (@player_ranking - @opponent_ranking).between?(113, 137)
                        @player_ranking += 3
                        @opponent_ranking -= 3
                    elsif
                        (@player_ranking - @opponent_ranking).between?(138, 187)
                        @player_ranking += 2
                        @opponent_ranking -= 2
                    elsif
                        (@player_ranking - @opponent_ranking).between?(188, 237)
                        @player_ranking += 1
                        @opponent_ranking -= 1
                    elsif
                        (@player_ranking - @opponent_ranking).between?(238, 250)
                        @player_ranking += 0
                        @opponent_ranking -= 0
                    end
                end
            
            elsif
                match_status(player.matches.last) == "Lost"
                if @player_ranking < @opponent_ranking
                    if (@opponent_ranking - @player_ranking).between?(0, 12)
                        @opponent_ranking += 8
                        @player_ranking -= 8
                    elsif
                        (@opponent_ranking - @player_ranking).between?(13, 37)
                        @opponent_ranking += 7
                        @player_ranking -= 7
                    elsif
                        (@opponent_ranking - @player_ranking).between?(19, 62)
                        @opponent_ranking += 6
                        @player_ranking -= 6
                    elsif
                        (@opponent_ranking - @player_ranking).between?(63, 87)
                        @opponent_ranking += 5
                        @player_ranking -= 5
                    elsif
                        (@opponent_ranking - @player_ranking).between?(88, 112)
                        @opponent_ranking += 4
                        @player_ranking -= 4
                    elsif
                        (@opponent_ranking - @player_ranking).between?(113, 137)
                        @opponent_ranking += 3
                        @player_ranking -= 3
                    elsif
                        (@opponent_ranking - @player_ranking).between?(138, 187)
                        @opponent_ranking += 2
                        @player_ranking -= 2
                    elsif
                        (@opponent_ranking - @player_ranking).between?(188, 237)
                        @opponent_ranking += 1
                        @player_ranking -= 1
                    elsif
                        (@opponent_ranking - @player_ranking).between?(237, 250)
                        @opponent_ranking += 0
                        @player_ranking -= 0
                    end
                
                elsif
                    @player_ranking > @opponent_ranking
                    if (@opponent_ranking - @player_ranking).between?(0, 12)
                        @opponent_ranking += 8
                        @player_ranking -= 8
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(13, 37)
                        @opponent_ranking += 10
                        @player_ranking -= 10
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(19, 62)
                        @opponent_ranking += 13
                        @player_ranking -= 13
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(63, 87)
                        @opponent_ranking += 16
                        @player_ranking -= 16
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(88, 112)
                        @opponent_ranking += 20
                        @player_ranking -= 20
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(113, 137)
                        @opponent_ranking += 25
                        @player_ranking -= 25
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(138, 162)
                        @opponent_ranking += 30
                        @player_ranking -= 30
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(163, 187)
                        @opponent_ranking += 35
                        @player_ranking -= 35
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(188, 212)
                        @opponent_ranking += 40
                        @player_ranking -= 40
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(213, 237)
                        @opponent_ranking += 45
                        @player_ranking -= 45
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(238, 250)
                        @opponent_ranking += 50
                        @player_ranking -= 50
                    end
                end
            player[:ranking] = @player_ranking
            player.matches.last.opponent.ranking = @opponent_ranking

            end
        @player_ranking
        @opponent_ranking
        end
    end
end
