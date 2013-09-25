module Game
  OPTIONS = {width: 300, height: 380}

  def clear
    @app.clear
    @app.background "#fff"
  end

  def restart
    @app.new_game
  end

  def welcome
    clear
    @app.stack do
      @app.image "logo.jpg", align: "center"
      @app.button "continue", width: 300 do
        clear
        yield
      end
      @app.image "bg.jpg", align: "center", margin_top: 55
    end
  end

  def set_random_pick
    hiragana = Dir["images/hiragana/*.png"]
    pick = File.basename(hiragana.sample).delete('.png')
    pick
  end

  def render_pick(pick)
    @app.image "images/hiragana/#{pick}.png", width: 300, height: 300
  end
end

class Mojibake
  include Game

  attr_accessor :app

  def initialize app
    @app = app
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
