################################################
#    BLUEPRINT FALL 2017 BOOTCAMP: RUBY LAB    #
################################################

def monte_carlo(num_samples = 1000)
  # In this problem, we will be using Monte Carlo integration to approximate the value
  # of pi. This is a statistical technique that uses random sampling and relative
  # areas to compute the area of a circle. Because of the law of large numbers, the
  # limit as we increase the number of samples gives us close to the true area.
  # You will only be implementing part of this function.
  #
  # This should get to you familiar with basic syntax, methods, ranges, and arithmetic
  # operations.

  # We will be using a seed to verify your answer
  rng = Random.new(142154165145160162151156164)
  hits = 0

  num_samples.times do
    # Replace the values of x and y with random values from -1 and 1. Make
    # sure you use the rng that we created!
    # See the Random library: https://ruby-doc.org/core-2.4.0/Random.html
    # Then, increment hits by the number of times (x, y) is within the circle
    # x^2 + y^2 = 1
    # *********** YOUR CODE BEGINS HERE *********** #

    # *********** YOUR CODE ENDS HERE *********** #
  end

  4.0 * hits / num_samples  # In Ruby you don't need to write "return" explicitly
                            # The last evaluated statement will be returned
end


def roboticize(string)
  # You may recall this example from the beginning of the Ruby tutorial,
  # except written in Python. Feel free to refer back to that if you need to.
  # Write a function that takes a sentence string (assume all characters are
  # alphanumeric or spaces) and returns the same sentence, except each word is
  # capitalized, and followed by a period.
  #
  # Hint: See String#split and Array#join
  #
  # Example:
  # > robotocize("How are you doing tODay")
  # => "How. Are. You. Doing. TODay."
  #
  # This should get you familiar with strings, iterators, and blocks

  # *********** YOUR CODE HERE *********** #
  nil
end


def scrabble(word)
  # You want to get a leg up on your next Scrabble game with your grandmother.
  # Write a function that takes a word (string) and returns the scrabble value of
  # that word. Use the hash provided to get the values. Assume the word has all
  # lowercase letters.
  #
  # Your code MUST be on a single line.
  #
  # Hint: Try to split the word to get the letters in an array
  # Hint: Are :this_one and "this_one" equivalent objects?
  # Hint: Look at Array#sum
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
  nil
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

  words = File.readlines("words.txt")  # Read lines into array
  words.map! { |word| word.strip }  # map! is the destructive version of map
  words.select! { |word| word.length > 5 }

  # *********** YOUR CODE HERE *********** #
  nil
end


# For this last problem, you'll be exposed to Ruby OOP, which will be important for
# understanding Rails object relationships and inheritance. You'll also get to see a
# bit of one of Ruby's cooler features: metaprogramming. We'll be exposing one of
# Ruby's built-in classes (String) to add a custom method. This is only a sliver of
# what metaprogramming encompasses, which is basically enabling code to treat the
# code itself as modifiable data. Rails has a LOT of it going on behind the scenes,
# hence the talk about "Rails magic"). Feel free to read more on it yourself if
# you're interested.
#
# In this problem we will be implementing a currency system and a helper method to
# compare the values of different currency. You may assume that the only currencies
# that exist are Dollar and Yen. Follow the steps below IN ORDER (they're numbered)
# to finish the implementation.

class Currency
  # Basically an abstract class, doesn't have too much meaning itself but provides
  # common methods that subclasses can utilize.

  # In Ruby you CANNOT access instance variables (@value) unless you declare
  # attr_accessor as such on the variables in the class.
  attr_accessor :value

  def initialize(value)
    unless value.is_a? Integer  # unless is the opposite of if
      raise TypeError.new("Cannot create Currency with non-Integer value #{value}")
    end
    @value = value  # equivalent to self.value = value in Python
  end

  def to_s
    raise NotImplementedError.new("Cannot display self.")
  end

  def compare(other)
    # Finally, you will implement the method Currency#compare, which compares
    # the value of any Currency object (or subclass) to any other Currency.
    # Return -1 if the value of self is less than that of other, 0 if equal, and
    # 1 otherwise. Hint: See the <=> operator to make things easy. NOTE: Dollar
    # objects are represented in CENTS. See Dollar for more detail.
    yen_in_dollar = 113.32
    # *********** 3. YOUR CODE BEGINS HERE *********** #
    nil
    # *********** 3. YOUR CODE ENDS HERE *********** #
  end

  def compare_with_info(other)
    infos = ["less than", "equal to", "greater than"]
    comparison = compare(other)
    puts "#{self} is #{infos[comparison + 1]} #{other}!"
    comparison
  end
end

class Dollar < Currency
  # Important note! Although the class is called Dollar, the @value instance is
  # actually represented as cents. This is because it is generally a bad idea to
  # use a floating point representation for money.
  def dollars
    @value / 100
  end

  def cents
    @value % 100
  end

  def to_s
    "Dollar: $#{dollars}.#{cents == 0 ? "00" : cents}"
  end
end

class Yen < Currency
  # Implement the Yen class, which is a subclass of Currency. The only method
  # you need to implement is Yen#to_s, which is approximately the same as __str__
  # in Python. We will need this to print our Yen object in a readable manner.
  # Your Yen object should print out in the following format: "Yen: ¥3000".
  # Feel free to implement more methods in this class later for your own convenience.
  # *********** 1. YOUR CODE BEGINS HERE *********** #

  # *********** 1. YOUR CODE ENDS HERE *********** #
end

class String
  # Next, we will be modifying the String class itself. Ruby uses open classes,
  # which allows us to "expose" the class and add a method of our own. We'll
  # add String#to_curr, which converts a string to the proper currency type
  # (either Dollar or Yen).
  def to_curr
    value = self.gsub(/[^0-9]/, "").to_i  # Numeric value of the string
    if self =~ /^\$[\d,]+(\.\d{2})?$/  # Matches dollar money format
      # Create a Dollar object with the correct CENTS value. We need to multiply
      # by 100 if there is no decimal point (format is $DDD...).
      $1 ? Dollar.new(value) : Dollar.new(value * 100)
    elsif self =~ /^¥[\d,]+$/  # Matches yen money format (no decimal)
      # *********** 2. YOUR CODE BEGINS HERE *********** #
      nil
      # *********** 2. YOUR CODE ENDS HERE *********** #
    else
      raise TypeError.new("Cannot convert #{self} to currency.")
    end
  end
end


puts monte_carlo 1000000
puts scrabble "equestrian"
puts scrabble "quixotry"
puts roboticize "Hello there my friend"
puts rhyming
puts a = "¥9,235".to_curr
puts b = "$2876".to_curr
puts d = "$300.00".to_curr
puts y = "¥34000".to_curr
a.compare_with_info(b)
a.compare_with_info(a)
y.compare_with_info(d)
d.compare_with_info(d)
