# encoding: utf-8
module Game
  OPTIONS = {width: 300, height: 380}

  HIRAGANA = {
    "a"   => "あ", "i"  => "い", "u"  => "う", "e"  => "え", "o"  => "お",
    "ka"  => "か", "ki" => "き", "ku" => "く", "ke" => "け", "ko" => "こ",
    "sa"  => "さ", "si" => "し", "su" => "す", "se" => "せ", "so" => "そ",
    "ta"  => "た", "ti" => "ち", "tu" => "つ", "te" => "て", "to" => "と",
    "na"  => "な", "ni" => "に", "nu" => "ぬ", "ne" => "ね", "no" => "の",
    "ha"  => "は", "hi" => "ひ", "hu" => "ふ", "he" => "へ", "ho" => "ほ",
    "ma"  => "ま", "mi" => "み", "mu" => "む", "me" => "め", "mo" => "も",
    "ya"  => "や",               "yu" => "ゆ",               "yo" => "よ",
    "ra"  => "ら", "ri" => "り", "ru" => "る", "re" => "れ", "ro" => "ろ",
    "wa"  => "わ",                                           "wo" => "を",
    "n"   => "ん"
  }

  FONT = case RUBY_PLATFORM
    when /mingw/; "MS UI Gothic"
    when /darwin/; "AppleGothic, Arial"
    else "Arial"
  end

  def pick_options opts={}
    opts.merge(:font => "#{FONT} 100px", :align => "center")
  end

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
    HIRAGANA.values.sample
  end

  def render_pick(pick)
    @app.title pick, pick_options
  end
end

class Mojibake
  def initialize app
    @app = app
    run
  end
end
