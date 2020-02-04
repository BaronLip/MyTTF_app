# README - Rails-portfolio-project_myttf_app
 
### This is a match tracking app intended for table tennis and a continuation of the Sinatra app.

### Dependencies:
Ruby 2.6.1p33

### Installation:
Download directory.\
Within command line/ terminal, navigate to directory:
1. Within terminal run $bundle install.
2. $ rails db:migrate.
3. $ rails s.
4. Within browser, navigate to "http://localhost:3000/" .
5. OAuth will not work unless customized by users own key and secret.

### Features:
- Signup/Login
    * Allows for OAuth sign-in through GitHub
    * Creates a Player via signup.
    * Optional login after signing up.
    * Validations are used for Player creation.
    * Use of flash messages in case of errors.
    * Navbar links change based on condition of whether or not player is logged in.
    * BCrypt is also use for authentication.

- Home/Index page
    * Shows all matches created by User.
        - Matches are shown in table format.
        - Win or Lose status is automatically determined by point values.
        - Ranking is automatically updated when adding a match.
    * Link to edit Player.
    * Links to create/edit new Opponent.
    * Link to created a new Match.
    * Link to edit existing Match.
    * Link to delete existing Match.
    * Link to logout.

- New Match page
    * Allows Player to create new Match.
        - player_score and opponent_score is limited to 21.
    * Flash messages used for validations, confirmations and us messages.
    * Links back to Player#show page.
    * Additional helper methods were used to determine:
        - ranking
        - win and loss count
        - total number of games
        - win percentage
        - whether Player won or lost the match

- Edit Match page
    * Allows User to edit existing Match and info.
    * Links back to Home page.

- New Opponent page
    * Allows User to create new Opponent.
        - redirects back to player home page and opponent is now added to the drop down.
    * Validations for opponent creation and confirmation.    
    

### Continued improvement/ Future features:
1. Add namespaced routes for Player and Admin.
2. Utilize CSS grid to create more visual impact.
3. New & Edit Match should have dynamic form based on match_type is chosen.
4. Be able to upload a profile photo for a Player.
5. Players and Opponents are the same class...