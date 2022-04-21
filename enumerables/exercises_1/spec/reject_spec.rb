RSpec.describe 'reject' do

  it 'removes zeroes' do
    numbers = [2, 93, 7, 0, 0, 1, 0, 31, 0, 368]
    filtered = numbers.reject do |number|
      number.zero?
    end
    expect(filtered).to eq([2, 93, 7, 1, 31, 368])
  end

  it 'removes vowels' do
    letters = ["a", "l", "l", " ", "y", "o", "u", "r", " ", "b", "a", "s", "e", " ", "a", "r", "e", " ", "b", "e", "l", "o", "n", "g", " ", "t", "o", " ", "u", "s"]
    remaining = letters.reject do |letter|
      letter.match?(/[aeiouy]/)
    end
    expect(remaining).to eq(["l", "l", " ", "r", " ", "b", "s", " ", "r", " ", "b", "l", "n", "g", " ", "t", " ", "s"])
  end

  it 'remove numbers divisible by 3' do
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    remaining = numbers.reject do |number|
      number % 3 == 0
    end
    expect(remaining).to eq([1, 2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20])
  end

  it 'remove words longer than three letters' do
    words = ["pill", "bad", "finger", "cat", "blue", "dog", "table", "red"]
    selected = words.reject do |word|
      word.length > 3
    end
    expect(selected).to eq(["bad", "cat", "dog", "red"])
  end

  it 'remove words ending in e' do
    words = ["are", "you", "strike", "thinking", "belt", "piece", "warble", "sing", "pipe"]
    selected = words.reject do |word|
      word.slice(-1) == 'e'
    end
    expect(selected).to eq(["you", "thinking", "belt", "sing"])
  end

  it 'remove words ending in ing' do
    words = ["bring", "finger", "drought", "singing", "bingo", "purposeful"]
    selected = words.reject do |word|
      word.slice(-3..-1) == 'ing'
    end
    expect(selected).to eq(["finger", "drought", "bingo", "purposeful"])
  end

  it 'remove words containing e' do
    words = ["four", "red", "five", "blue", "pizza", "purple"]
    selected = words.reject do |word|
      word.match?('e')
    end
    expect(selected).to eq(["four", "pizza"])
  end

  it 'remove dinosaurs' do
    animals = ["tyrannosaurus", "narwhal", "eel", "achillesaurus", "qingxiusaurus"]
    notasaurus = animals.reject do |animal|
      animal.include?('saurus')
    end
    expect(notasaurus).to eq(["narwhal", "eel"])
  end

  it 'remove numbers' do
    elements = ["cat", "dog", 23, 81.1, 56, "aimless", 43]
    not_numbers = elements.reject do |element|
      element.class == Float || element.class == Integer
    end
    expect(not_numbers).to eq(["cat", "dog", "aimless"])
  end

  it 'remove floats' do
    elements = ["cat", "dog", 32.333, 23, 56, "aimless", 43.2]
    not_numbers = elements.reject do |element|
      element.class == Float
    end
    expect(not_numbers).to eq(["cat", "dog", 23, 56, "aimless"])
  end

  it 'remove animals starting with a vowel' do
    animals = ["aardvark", "bonobo", "cat", "dog", "elephant"]
    remaining = animals.reject do |animal|
      animal.slice(0) == 'a' || animal.slice(0) == 'e'
    end
    expect(remaining).to eq(["bonobo", "cat", "dog"])
  end

  it 'remove upcased words' do
    words = ["CAT", "dog", "AIMLESS", "Trevor", "butter"]
    remaining = words.reject do |word|
      word.match?(/[A-Z]/) unless word.match(/[a-z]/)
    end
    expect(remaining).to eq(["dog", "Trevor", "butter"])
  end

  it 'remove arrays' do
    elements = ["CAT", ["dog"], 23, [56, 3, 8], "AIMLESS", 43, "butter"]
    remaining = elements.reject do |element|
      element.class == Array
    end
    expect(remaining).to eq(["CAT", 23, "AIMLESS", 43, "butter"])
  end

  it 'remove hashes' do
    elements = ["cat", {:dog=>"fido"}, 23, {:stuff=>"things"}, "aimless", 43]
    remaining = elements.reject do |element|
      element.class == Hash
    end
    expect(remaining).to eq(["cat", 23, "aimless", 43])
  end
end
