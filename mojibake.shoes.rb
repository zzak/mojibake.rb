class Mojibake
  attr_accessor :app, :pick

  def initialize app
    @app = app
    hiragana = Dir["images/hiragana/*.png"]
    @pick = File.basename(hiragana.sample).delete('.png')
    render_welcome
  end

  def render_welcome
    clear
    @app.stack do
      @app.image "logo.jpg", align: "center"
      @app.button "continue", width: 300 do
        clear
        render_quiz
      end
      @app.image "bg.jpg", align: "center", margin_top: 55
    end
  end

  def render_quiz
    @app.image "images/hiragana/#{@pick}.png", width: 300, height: 300
    guess = @app.edit_line width: 290
    @app.button "Guess", width: 300 do
      if guess.text == @pick
        @app.alert "Congratulations!"
      else
        @app.alert "Wrong! The correct answer was: #{@pick}."
      end
      @app.new_game
    end
  end

  def clear
    @app.clear
    @app.background "#fff"
  end
end

Shoes.app width: 300, height: 380 do
  def new_game
    @mojibake = Mojibake.new self
  end
  new_game
end
