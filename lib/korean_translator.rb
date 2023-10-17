require 'gimchi'
require 'json'

class KoreanTranslator
  attr_reader :show_romanji, :user_sentence, :translated_sentence

  VOCABULARY = JSON.parse(File.read('translations.json'))

  def initialize
    @show_romanji = false
    @user_sentence = ''
  end
  
  def start_practice
    puts 'This translator replaces select words that are in a vocabulary list of common words.'
    get_romanji_input
    get_practice_sentence
    translate_to_korean
  end
  
  def get_romanji_input
    puts 'Type YES and press Enter to include the roman spelling.'
    @show_romanji = gets.chomp.upcase == 'YES'
    puts @show_romanji ? 'Romanji ON' : 'Romanji OFF'
  end
  
  def get_practice_sentence
    puts 'Type sentence in English and press Enter.'
    @user_sentence = gets.chomp
    @translated_sentence = @user_sentence
  end


  def translate_to_korean
    @user_sentence.split(/[\s,'?]/).each do |word, i|
      korean_word = VOCABULARY[word.capitalize]
      if korean_word
        korean_word += "(#{Gimchi.romanize(korean_word)})" if @show_romanji
        @translated_sentence.gsub!(word, korean_word)
      end
    end
  
    puts @translated_sentence
  end
end

KoreanTranslator.new.start_practice