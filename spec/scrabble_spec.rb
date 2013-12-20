require './lib/scrabble'

describe Scrabble do

  describe '.letter_value' do
    it 'returns letter value' do
      expect( Scrabble.letter_value['A'] ).to eq 1
    end
  end

  describe '.score' do
    it 'scores a single letter' do
      expect( Scrabble.score('a') ).to eq 1
      expect( Scrabble.score('f') ).to eq 4
    end

    it 'scores a word' do
      expect( Scrabble.score('hello') ).to eq 8
    end
  end

  describe '.highest_score_from' do
    context 'when there IS a point tie' do
      it 'returns highest scoring word' do
        expect( Scrabble.highest_score_from(['home', 'word', 'hello', 'sound']) ).to eq 'home'
      end
    end

    context 'when there is NOT a POINT TIE' do
      it 'returns word with the fewest letters' do
        expect( Scrabble.highest_score_from(['hello', 'word', 'sound']) ).to eq 'word'
      end
    end

    context 'when seven letter words' do
      
      context 'when ONE of the highest scores is seven letters' do
        it 'returns seven letter word' do
          expect( Scrabble.highest_score_from(['hello', 'inker', 'silence']) ).to eq 'silence'
        end
      end

      context 'when TWO of the highest scores is seven letters' do
        it 'returns first seven letter word in array' do
          expect( Scrabble.highest_score_from(['hello', 'silence', 'license']) ).to eq 'silence'
        end
      end
    end

    context 'when NO seven letter words' do
      context 'when there IS a point tie AND length tie' do
        it 'returns the first word in array' do
          expect( Scrabble.highest_score_from(['shoe', 'hose', 'sound']) ).to eq 'shoe'
        end
      end
    end
  end

  describe '.fewest_letters_from' do
    it 'returns a hash of words and score with the fewest lettes' do
      expect( Scrabble.fewest_letters_from(['hello', 'word']) ).to eq 'word'
    end
  end

  describe '.word_scores' do
    it 'returns a hash with word and score' do
      expect( Scrabble.send(:word_scores, ['hello', 'word', 'sound']) ).to eq({'hello'=>8, 'word'=>8, 'sound'=>6})
    end
  end

  describe '.seven_letter_words_from' do
    it 'returns a hash of words and scores with seven letters' do
      expect( Scrabble.seven_letter_words_from(['home', 'word', 'silence']) ).to eq(['silence'])
    end
  end
end
