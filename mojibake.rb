hiragana = {
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

puts "Welcome to mojibake (文字化け) [press enter to continue]"

while gets.chomp == "\n"; end

pick = hiragana.values.sample
print "What is the equivalent for #{pick}?: "
answer = gets.chomp
if hiragana[answer] == pick
  puts "Congratulations!"
else
  puts "Sorry, the correct answer was: #{hiragana.key(pick)}"
end
