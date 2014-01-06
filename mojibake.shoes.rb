require 'helpers/game'

class Mojibake
  include Game

  def run
    welcome do
      pick = set_random_pick
      render_pick pick

      guess = @app.edit_line width: 290
      @app.button "Guess", width: 300 do
        check_guess(guess.text, pick)
        restart
      end
    end
  end

  def check_guess(guess, pick)
    if guess == pick
      @app.alert "Congratulations!"
    else
      @app.alert "Wrong! The correct answer was: #{pick}."
    end
  end
end

Shoes.app Game::OPTIONS do
  def new_game
    Mojibake.new self
  end
  new_game
end
