class Scrabble
  def self.letter_value
    {
      'A'=>1, 'B'=>3, 'C'=>3, 'D'=>2,
      'E'=>1, 'F'=>4, 'G'=>2, 'H'=>4,
      'I'=>1, 'J'=>8, 'K'=>5, 'L'=>1,
      'M'=>3, 'N'=>1, 'O'=>1, 'P'=>3,
      'Q'=>10, 'R'=>1, 'S'=>1, 'T'=>1,
      'U'=>1, 'V'=>4, 'W'=>4, 'X'=>8,
      'Y'=>4, 'Z'=>10
    }  
  end
 
  def self.score(word)
    score = 0
    word.chars.each do |letter|
      score += letter_value["#{letter.upcase}"].to_i
      score
    end
    score
  end

  def self.highest_score_from(words)
    scores = word_scores(words)
    highest_scores = scores.select { |k, v| v == scores.values.max }
    seven_letter_words = seven_letter_words_from(highest_scores.keys)  

    if seven_letter_words.length > 0
      seven_letter_words.first 
    else
      fewest_letters_from(highest_scores.keys)
    end
  end

  private

  def self.fewest_letters_from(words)
    words.sort_by { |word| word.length }.first
  end

  def self.word_scores(words)
    scores = {}
    words.each do |word|
      scores[word] = score(word)
    end
    scores
  end

  def self.seven_letter_words_from(words)
    seven_letter_words = []
    words.each do |word|
      seven_letter_words << word if word.length == 7
    end
    seven_letter_words
  end
end
