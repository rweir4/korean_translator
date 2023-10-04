require 'gimchi'
require 'json'

class KoreanTranslator
  VOCABULARY = JSON.parse(File.read('translations.json'))
  
  def initialize
    puts 'This translator replaces select words that are in a vocabulary list of common words.'
    puts 'Type YES and press Enter to include the roman spelling.'
    @show_roman = gets.chomp.upcase == 'YES'
    puts 'Type sentence in English and press Enter.'
    @user_sentence = gets.chomp
    @translated_sentence = @user_sentence
  end
  
  def translate_to_korean
    @user_sentence.split(/[\s,'?]/).each do |word, i|
      korean_word = VOCABULARY[word.capitalize]
      if korean_word
        korean_word += "(#{Gimchi.romanize(korean_word)})" if @show_roman
        @translated_sentence.gsub!(word, korean_word)
      end
    end
  
    @translated_sentence
  end
end

puts KoreanTranslator.new.translate_to_korean