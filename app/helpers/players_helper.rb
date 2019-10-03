module PlayersHelper

    def ranking(player)  
        if player.matches.count == 0
            player.ranking
        else
            @current_ranking = player.ranking
            @opponent_ranking = player.matches.last.opponent.ranking

            if match_status(player.matches.last) == "Won"
                # binding.pry
                if @current_ranking < @opponent_ranking
                    if (@opponent_ranking - @current_ranking).between?(0, 12)
                        @current_ranking += 8
                        @opponent_ranking -= 8
                    elsif
                        (@opponent_ranking - @current_ranking).between?(13, 37)
                        @current_ranking += 10
                        @opponent_ranking -= 10
                    elsif
                        (@opponent_ranking - @current_ranking).between?(19, 62)
                        @current_ranking += 13
                        @opponent_ranking -= 13
                    elsif
                        (@opponent_ranking - @current_ranking).between?(63, 87)
                        @current_ranking += 16
                        @opponent_ranking -= 16
                    elsif
                        (@opponent_ranking - @current_ranking).between?(88, 112)
                        @current_ranking += 20
                        @opponent_ranking -= 20
                    elsif
                        (@opponent_ranking - @current_ranking).between?(113, 137)
                        @current_ranking += 25
                        @opponent_ranking -= 25
                    elsif
                        (@opponent_ranking - @current_ranking).between?(138, 162)
                        @current_ranking += 30
                        @opponent_ranking -= 30
                    elsif
                        (@opponent_ranking - @current_ranking).between?(163, 187)
                        @current_ranking += 35
                        @opponent_ranking -= 35
                    elsif
                        (@opponent_ranking - @current_ranking).between?(188, 212)
                        @current_ranking += 40
                        @opponent_ranking -= 40
                    elsif
                        (@opponent_ranking - @current_ranking).between?(213, 237)
                        @current_ranking += 45
                        @opponent_ranking -= 45
                    elsif
                        (@opponent_ranking - @current_ranking).between?(238, 250)
                        @current_ranking += 50
                        @opponent_ranking -= 50
                    end
                
                elsif
                    @current_ranking > @opponent_ranking
                    if (@current_ranking - @opponent_ranking).between?(0, 12)
                        @current_ranking += 8
                        @opponent_ranking -= 8
                    elsif
                        (@current_ranking - @opponent_ranking).between?(13, 37)
                        @current_ranking += 7
                        @opponent_ranking -= 7
                    elsif
                        (@current_ranking - @opponent_ranking).between?(19, 62)
                        @current_ranking += 6
                        @opponent_ranking -= 6
                    elsif
                        (@current_ranking - @opponent_ranking).between?(63, 87)
                        @current_ranking += 5
                        @opponent_ranking -= 5
                    elsif
                        (@current_ranking - @opponent_ranking).between?(88, 112)
                        @current_ranking += 4
                        @opponent_ranking -= 4
                    elsif
                        (@current_ranking - @opponent_ranking).between?(113, 137)
                        @current_ranking += 3
                        @opponent_ranking -= 3
                    elsif
                        (@current_ranking - @opponent_ranking).between?(138, 187)
                        @current_ranking += 2
                        @opponent_ranking -= 2
                    elsif
                        (@current_ranking - @opponent_ranking).between?(188, 237)
                        @current_ranking += 1
                        @opponent_ranking -= 1
                    elsif
                        (@current_ranking - @opponent_ranking).between?(238, 250)
                        @current_ranking += 0
                        @opponent_ranking -= 0
                    end
                end
            
            elsif
                match_status(player.matches.last) == "Lost"
                if @current_ranking < @opponent_ranking
                    if (@opponent_ranking - @current_ranking).between?(0, 12)
                        @opponent_ranking += 8
                        @current_ranking -= 8
                    elsif
                        (@opponent_ranking - @current_ranking).between?(13, 37)
                        @opponent_ranking += 7
                        @current_ranking -= 7
                    elsif
                        (@opponent_ranking - @current_ranking).between?(19, 62)
                        @opponent_ranking += 6
                        @current_ranking -= 6
                    elsif
                        (@opponent_ranking - @current_ranking).between?(63, 87)
                        @opponent_ranking += 5
                        @current_ranking -= 5
                    elsif
                        (@opponent_ranking - @current_ranking).between?(88, 112)
                        @opponent_ranking += 4
                        @current_ranking -= 4
                    elsif
                        (@opponent_ranking - @current_ranking).between?(113, 137)
                        @opponent_ranking += 3
                        @current_ranking -= 3
                    elsif
                        (@opponent_ranking - @current_ranking).between?(138, 187)
                        @opponent_ranking += 2
                        @current_ranking -= 2
                    elsif
                        (@opponent_ranking - @current_ranking).between?(188, 237)
                        @opponent_ranking += 1
                        @current_ranking -= 1
                    elsif
                        (@opponent_ranking - @current_ranking).between?(237, 250)
                        @opponent_ranking += 0
                        @current_ranking -= 0
                    end
                
                elsif
                    @current_ranking > @opponent_ranking
                    if (@opponent_ranking - @current_ranking).between?(0, 12)
                        @opponent_ranking += 8
                        @current_ranking -= 8
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(13, 37)
                        @opponent_ranking += 10
                        @current_ranking -= 10
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(19, 62)
                        @opponent_ranking += 13
                        @current_ranking -= 13
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(63, 87)
                        @opponent_ranking += 16
                        @current_ranking -= 16
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(88, 112)
                        @opponent_ranking += 20
                        @current_ranking -= 20
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(113, 137)
                        @opponent_ranking += 25
                        @current_ranking -= 25
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(138, 162)
                        @opponent_ranking += 30
                        @current_ranking -= 30
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(163, 187)
                        @opponent_ranking += 35
                        @current_ranking -= 35
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(188, 212)
                        @opponent_ranking += 40
                        @current_ranking -= 40
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(213, 237)
                        @opponent_ranking += 45
                        @current_ranking -= 45
                    elsif
                        (@opponent_ranking - @opponent_ranking).between?(238, 250)
                        @opponent_ranking += 50
                        @current_ranking -= 50
                    end
                end
            player[:ranking] = @current_ranking
            player.matches.last.opponent.ranking = @opponent_ranking
            end
        @current_ranking
        @opponent_ranking
        end
    end
end
