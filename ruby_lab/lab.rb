################################################
#    BLUEPRINT FALL 2017 BOOTCAMP: RUBY LAB    #
################################################


def roboticize(string)
  # You may recall this example from the beginning of the Ruby tutorial,
  # except written in Python. Feel free to refer back to that if you need to.
  # Write a function that takes a sentence string (assume all characters are
  # alphanumeric or spaces) and returns the same sentence, except each word is
  # capitalized, and followed by a period.
  #
  # Example:
  # > robotocize("How are you doing tODay")
  # => "How. Are. You. Doing. TODay."
  #
  # This should get you familiar with strings, iterators, and blocks

  # *********** YOUR CODE HERE *********** #
end


def scrabble(word)
  # You want to get a leg up on your next Scrabble game with your grandmother.
  # Write a function that takes a word (string) and returns the scrabble value of
  # that word. Use the hash provided to get the values. Assume the word has all
  # lowercase letters.
  #
  # Your code MUST be on a single line.
  #
  # Hint: Try to split the word with "" to get the letters in an array
  # Hint: Are :this_one and "this_one" equivalent objects?
  # Hint: Use the sum array helper method
  #
  # Example:
  # > scrabble("equestrian")
  # => 19
  #
  # This should get you familiar with basic operators, strings, symbols, and
  # iterators.

  values = {
    a: 1,
    b: 3,
    c: 3,
    d: 2,
    e: 1,
    f: 4,
    g: 2,
    h: 4,
    i: 1,
    j: 8,
    k: 5,
    l: 1,
    m: 3,
    n: 1,
    o: 1,
    p: 3,
    q: 10,
    r: 1,
    s: 1,
    t: 1,
    u: 1,
    v: 4,
    w: 4,
    x: 8,
    y: 4,
    z: 10,
  }
  # *********** YOUR CODE HERE *********** #
end


def rhyming()
  # Are there truly no words that rhyme with "orange"? Perhaps we can investigate.
  # An array of English words is loaded into memory for you. For this task, you
  # want to find all the words that that have the suffix "range". Then, you should
  # create a hash that has keys :arange, :erange, :irange, :orange, and :urange.
  # For each key, store an array of all the words that have that particular suffix.
  # Return that hash. Are there any true rhymes?
  #
  # This should get you familiar with arrays, hashes, iterators, regex?, and blocks

  words = File.readlines("words.txt")
  words.map! { |word| word.strip }
  words.select! { |word| word.length > 5 }

  # *********** YOUR CODE HERE *********** #
end
