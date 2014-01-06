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
      @app.image "images/logo.jpg", align: "center"
      @app.button "continue", width: 300 do
        clear
        yield
      end
      @app.image "images/bg.jpg", align: "center", margin_top: 55
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
  def initialize app
    @app = app
    run
  end
end
