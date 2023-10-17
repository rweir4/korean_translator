require_relative '../lib/korean_translator.rb'

describe KoreanTranslator do
  let(:practice_instance) { described_class.new }
  let(:sentence) { 'Hello, my name is Bot.' }
  
  describe '#start_practice' do
    it 'should output instructions' do
      expect { practice_instance.start_practice }
      .to output(a_string_including('This translator replaces select words that are in a vocabulary list of common words.'))
      .to_stdout
    end
  end
  
  describe '#get_romanji_input' do
    it 'should receive user input for romanji setting on' do
      allow(practice_instance).to receive(:gets).and_return('yes')

      expect(practice_instance.show_romanji).to be(false)
      expect { practice_instance.get_romanji_input }
        .to output(a_string_including('Type YES and press Enter to include the roman spelling.'))
        .to_stdout
      expect(practice_instance.show_romanji).to be(true)
    end

    it 'should receive user input for romanji setting off' do
      expect(practice_instance.show_romanji).to be(false)
      expect { practice_instance.get_romanji_input }
        .to output(a_string_including('Type YES and press Enter to include the roman spelling.'))
        .to_stdout
      expect(practice_instance.show_romanji).to be(false)
    end
  end
  
  describe '#get_practice_sentence' do    
    it 'translate words from sentence that appear in vocabulary list' do
      allow(practice_instance).to receive(:gets).and_return(sentence)
      practice_instance.get_practice_sentence
      expect(practice_instance.user_sentence).to eq(sentence)
    end
  end  

  describe '#translate_to_korean' do
    let(:translated_with_romanji) { '안녕하세요(annyeonghaseyo), my 이름(ireum) is Bot.' }
    let(:translated_sans_romanji) { '안녕하세요, my 이름 is Bot.' }
    
    it 'translate words from sentence that appear in vocabulary list' do
      allow(practice_instance).to receive(:gets).and_return('yes')
      practice_instance.get_romanji_input
      
      allow(practice_instance).to receive(:gets).and_return(sentence)
      practice_instance.get_practice_sentence

      practice_instance.translate_to_korean
      expect(practice_instance.translated_sentence).to eq(translated_with_romanji)
    end

    
    it 'translate words from sentence that appear in vocabulary list' do
      allow(practice_instance).to receive(:gets).and_return('')
      practice_instance.get_romanji_input
      
      allow(practice_instance).to receive(:gets).and_return(sentence)
      practice_instance.get_practice_sentence

      practice_instance.translate_to_korean
      expect(practice_instance.translated_sentence).to eq(translated_sans_romanji)
    end
  end
end