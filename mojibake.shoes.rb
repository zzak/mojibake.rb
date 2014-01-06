# encoding: utf-8
require 'helpers/game'

class Mojibake
  include Game

  def run
    welcome do
      pick = HIRAGANA.values.sample
      @app.stack do
        @app.title pick, pick_options
      end

      guess = @app.edit_line width: 290
      @app.button "Guess", width: 300 do
        if HIRAGANA[guess] == pick
          @app.alert "Congratulations!"
        else
          @app.alert "Wrong! The correct answer was: #{HIRAGANA.key(pick)}."
        end
        restart
      end
    end
  end
end

Shoes.app Game::OPTIONS do
  def new_game
    Mojibake.new self
  end
  new_game
end
