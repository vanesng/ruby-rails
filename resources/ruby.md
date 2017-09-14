# Ruby

---

Ruby is a general-purpose object-oriented language designed by a Japanese man for English lovers. Unlike Python, which prioritizes making everything explicit and obvious to the programmer, it was created to read just like English. It is not uncommon for many Ruby statements to read just like grammatical sentences, so even if one is unfamiliar with the exact syntax, the meaning can probably be inferred. For contrast, consider the Python expression below, which imparts a robotic effect on any sentence string.

```py
>>> ". ".join([word.capitalize() for word in "Welcome to Blueprint good friend.".split()])
'Welcome. To. Blueprint. Good. Friend.'
```

The syntax is strict, and follows very procedurally from the inside out through all the method calls. It surely doesn't read like English, but to a Python programmer with enough experience, it's very cozy and readable.

Ruby has a different take on syntactic style. Try to read the following Ruby expression:

```ruby
['piña colada', 'gin and tonic', 'lemon juice'].each { |drink| print drink.capitalize }
```

"Piña colada, gin and tonic, lemon juice: for each drink, print drink, capitalized." It's so simple, even your 1st grade cousin could tell you what the output should be.

This was obviously intended to give the code much more readability, but to the programmer it may actually be quite frustrating. In the following sections, read on while keeping in mind the paradigms described above to make sense of why Ruby may look different from languages you're used to, and also how it could be extremely efficient given enough practice.

---

## Who is this Guide for?

This guide is intended for programmers who have already had prior experience with high-level languages such as Python or Javascript, but may never have used Ruby before or have had minimal training in its syntax and semantics. If you've used Ruby before while developing for a project, then many things will seem familiar, but feel free to use this guide as a condensed reference for structures that will frequently come up in your development.

## Getting Started

Getting interactive is a must when learning anything in CS, so the first thing you should know is how to write and run ruby programs, as well as using the Ruby shell \(IRB\).

Ruby programs are `*.rb` files, and you can **run them** by simply calling `ruby your_program.rb`.

In order to access the **Ruby shell**, type `irb` into your terminal, which should open a prompt similar to below \(type `exit` to exit\):

```
irb(main):001:0>
```

You're all set! Throughout this tutorial, interact frequently with the Ruby shell and test out various expressions for yourself. This will give you a much more solidified understanding of concepts than simply skimming through.

---

## Basic Syntax

### Symbols

**Symbols** are an important component of the Ruby language and are used very commonly in Rails development. A symbol is prefixed by a colon, like such: `:a_symbol`. They may look like variables, but actually **they are essentially strings** with some subtle differences that you should remember.

Symbols are **processed more quickly** than strings by Ruby, due to the following differences:

* Symbols are **immutable**, strings are not. You can index and modify a string character, but this is impossible for symbols.
* Symbols are **unique: **`:symbol.object_id`** **will always yield the same value, while if you try `"symbol".object_id` multiple times, it will yield different values
* Symbols don't have any of the `String` class's methods, and thus you shouldn't be doing any sort of character-wise manipulation on a symbol. They are used internally to reference method names, serve as hash keys, denote model attributes \(in Rails\), denote enum values, and so on.

### Hashes

**Hashes** are one of the more confusing structures you'll encounter initially, and they're used very commonly in Rails programming. They tend to use symbols very generously, so make sure you've read the previous section on those. Here's the most general way to declare a hash:

```ruby
my_hash = {1 => 2, :secret => "this_is_my_password", "hello" => :there}

my_hash[:secret] # Returns "this_is_my_password"
my_hash[:not_secret] = "this_is_my_username" # Adds this key, value pair to my_hash
```

As with Python dictionaries, the basic rules apply; most importantly, don't use any mutable keys. The most common usage of hashes uses symbols for every key, like such:

```ruby
symbol_hash = {:lat => 24.2222, :lon => 68.3933}
```

When **all keys of a hash are symbols**, you can use this special \(preferred\) syntax, which is equivalent:

```ruby
symbol_hash = {lat: 24.2222, lon: 68.3933} # Note that the colon has shifted from left to right of the keys
```

Hashes are very similar in syntax to keyword parameters of functions \(a potential source of confusion in your first Rails adventure\), and in fact they can be used interchangeably. For now, just remember the basics and see [this reference](https://ruby-doc.org/core-2.2.0/Hash.html) for more info about hash iterators and helper methods.

### Arrays and Strings

**Arrays** are created and used very similarly to other high level languages:

```ruby
# Four ways of creating an array
a = Array.new # Returns []
a = Array.new(3) # Returns [nil, nil, nil]
a = Array.new(3, true) # Returns [true, true, true]
a = [1, 2, 3] # Returns [1, 2, 3]

# Some useful array helpers
a.length # Returns 3
a.empty? # Returns false
a.include?(4) # Returns false
a.push(4) # Returns [1, 2, 3, 4]
a << 5 # Returns [1, 2, 3, 4, 5]
a.pop # Returns 5, pops the last item so a is now [1, 2, 3, 4]
a.shift # Returns 1, pops the first item so a is now [2, 3, 4]
```

Iterators will be discussed later with blocks. For more info on array syntax and various helper methods, see [here](https://ruby-doc.org/core-2.4.1/Array.html).

**Strings** are very versatile in Ruby and have a ton of helper methods. There are too many to cover \(see [here](https://ruby-doc.org/core-2.4.0/String.html) for them all\), but here are some highlights:

```ruby
"Hello " + "World" # Returns "Hello World"
"%s, I've a feeling we're not in %s anymore." % ["Toto", "Kansas"] # Returns "Toto, I've a feeling we're not in Kansas anymore."
the_one = "ring"
the_one << "worm" # Returns "ringworm"
the_one # Returns "ringworm"

# String comparison
"abcdef" <=> "abcde" # Returns 1, the former string is "greater"
"abcdef" <=> "abcdef" # Returns 0
"abcdef" <=> "abcdefg" # Returns -1

# String regex is built-in
"(510)943-2424"[/\d{3}-\d{4}/] # Returns "943-2424"
"(510)943-2424"[/911/] # Returns nil

# String splitting
"Too many blank lines in this sentence".split # Returns ["Too", "many", "blank", "lines", "in", "this", "sentence"]

# String stripping
" Needs cleaning ".strip # Returns "Needs cleaning"
```

Strings and arrays can both be indexed, using perhaps familiar syntax.

```ruby
strange_sentence = "Doc, Note: I Dissent. A Fast Never Prevents A Fatness. I Diet On Cod."

strange_sentence[0] # Returns "D"
strange_sentence[5..8] # Returns "Note"
strange_sentence[5...8] # Returns "Not" (the triple ellipsis excludes the end index)
strange_sentence[0..-1] # Returns the whole string (double ellipsis is inclusive)
strange_sentence[1, 3] # Returns "oc," (same as strange_sentence[1..3])
strange_sentence['Cod'] # Returns "Cod" (exists in string)
strange_sentence['NOT IN SENTENCE'] # Returns nil, (doesn't exist in string)
```

### Control Statements

Ruby offers standard statements for determining control flow in your program. Here's what they look like:

```ruby
if 100.is_a? String
  puts "YAY"
elsif "BLUEPRINT".is_a? Integer
  puts "NOO"
else
  puts "yup" # This will print
end
```

Something worthy of mentioning is that Ruby also has **unless**, which you can think of as being equivalent to "if not."

```ruby
unless "BLUEPRINT".is_a? Integer
  puts "yee" # This will print
end
```

### Functions and Methods

**Functions** and **methods** are very similar in structure to those in Python. However, they **do not need explicit return statements**; the value of the last evaluated statement will be returned. Generally, most statements evaluated in Ruby will have a return value \(even assignments!\).

```ruby
def fib(n)
  if n < 0
    raise ArgumentError.new("Can't compute negative fib.")
  end
  return 1 if n == 0
  return 1 if n == 1
  fib(n-1) + fib(n-2)
  end
```

An important note to keep in mind is that functions and methods **need not be called using parentheses** under certain circumstances \(these are general rules of thumb for best style practices\):

* If there are no arguments to the function call
* If the function does not return a value \(returns `nil`\)

Understanding this, the following Rails controller code for creating an admin makes sense:

```ruby
def create
  if @admin.save
    render json: @admin, serializer: AdminSerializer
  else
    error_response(@admin)
  end
end
```

`save` is a method of the `@admin` instance called with no arguments, and returns `true` if successfully saved into the DB. `render` is a function called with keyword arguments `json: @admin` and `serializer: AdminSerializer`. We don't typically use its return value, so we omit the parentheses. `error_response` is called with one argument, and as you can see it is also syntactically correct to include the parentheses.

---

## Scope

**Global variables** are available in any scope, and are prefixed by a **cash \($\) **symbol.

```ruby
$HOURLY_CASH = 40 # Declare a global variable that can be referenced from anywhere
your_salary = $HOURLY_CASH * 8 * 5 * 12
```

**Local variables** are only available in the scope in which they were declared \(very similar to Python\).

**Blocks** are Ruby constructs embedded into the syntax for certain method calls. They operate similarly to lambdas and anonymous functions, but they don't mean anything by themselves. They** **have similar scope to local variables. Variables defined within the block are only accessible within the block, and the block parameters \(defined between the two `|` 's\) take precedence over other variables outside the block with the same name. Consider the following example:

```ruby
action = "saved"
actions = ["ignited", "invaded", "obliterated"]

# This is a type of block
actions.each do |action| # action is a block parameter
puts "Aliens have come and #{ action } the Earth."
end

# This is the one-liner equivalent of the above; the block must be contained within { }
actions.each { |action| puts "Aliens have come and #{ action } the Earth." }

puts "Aliens have come and #{ action } the Earth."
```

What will be the output of the program from the block statement?

Aliens have come and ignited the Earth.
Aliens have come and invaded the Earth.
Aliens have come and obliterated the Earth.
Aliens have come and saved the Earth. # `action` is not modified by the block parameter `action`

---

## Classes and OOP

In Ruby, **everything** is an object. This imparts a degree of elegance in many situations, but the abstraction may also be confusing when trying to decipher the language for the first time.

Let's pretend we've opened our ruby terminal for the first time. We jump right into Hello World'ing by defining a function in the global namespace:

```ruby
def hello_world
  puts "HELLO WORLD!!!"
end
```

Our "function" `hello_world` may look familiar for those who've used Python. However, it is actually a **method**, belonging to the overarching **Kernel **class. The `Kernel` class is Ruby's master class; it is accessible from anywhere in our program, as are its methods. Other examples of `Kernel` methods are `print` and `puts` and `gets`.

The below example demonstrates how to create **class variables** and **instance variables** in Ruby, as well as how to write a constructor for a class.

```ruby
class Car
  @@num_tires = 4 # Class variable: one copy per CLASS

  def initialize(make, model, mpg) # Constructor
    @make = make # Instance variable: one copy per OBJECT
    @model = model
    if @mpg > 100
      raise ArgumentError, "Such efficiency is impossible."
    end
    @mpg = mpg
    this = "is useless" # Local variable: only exists within the scope of Car#initialize
```

```ruby
your_car = Car("Honda", "Civic", 35)

my_car = Car("Maserati", "GranTurismo", 15)

puts Car::num_tires
puts your_car.make
```

Now let's look at methods. Class methods are shared among all object members of a class, while instance methods utilize the particular object from which you are calling the method. Thus, you are prohibited from using any instance variables in a class method.

**Class methods**

```ruby
class Wizard

  # Can use the Wizard class itself
  def Wizard.obliviate(muggle)
    muggle.loses_memory
  end

  # Or just use self, which always points to the current object
  def self.disapparate(object)
    object.will_disappear_soon
  end
```

### Inheritance

Inheritance works in Ruby like it does in Python. A class is said to subclass another with the following relationship: `SubClass < Class`. Methods in the subclass will override methods from the base class, and subclasses are still able to utilize methods only defined in the base class.

```ruby
class Bird
  def preen
    puts "I am cleaning my feathers."
  end

  def fly
    puts "I am flying."
  end
end

class Penguin < Bird
  def fly
    puts "Sorry. I'd rather swim."
  end
end
```

In this example above, `Penguin`'s will print `"Sorry. I'd rather swim."` when the `fly` method is evaluated, but they can still `preen` just like any other `Bird` can.

---

## Blocks and Iterators

```ruby
destinations = [:france, :scotland, :japan, :montenegro]

# `.each` establishes an iterator though destinations, which gets passed into a block
destinations.each do |country| # Start a block with `do`
  puts "This winter, I will travel to #{ country }."
end # End a block with `end`

# Blocks and iterators can be chained
destinations.sort_by { |country| country[-1] }.each do |country|
  puts "This summer, I will travel to #{ country }."
end
```

### Map, Collect, and Each

You will almost never encounter a for loop while developing in Ruby. There's generally no good reason for you to use one over the iterator `each`, which was demonstrated above. Ruby offers a suite of other iterator functions, including `map` and `collect`, so which one should you use?

First, `map` and `collect` are exactly the same, as they are identical in implementation. What `each` does is take the elements of an iterable and apply the following block to each element \(without modifying the original array\). `map` is also a non-destructive function, but what it returns is a new array with each element transformed by the block.

`map!` and `collect!` are the destructive methods to their respective counterparts. Generally, there are destructive versions of methods \(ending in `!`\) belonging to iterable classes. Ruby allows symbols like `!` and `?` to be included in method names for readability, like `100.instance_of? Integer`.

---

## Miscellaneous Tips

In order to check whether an object has a certain method, call the object's `respond_to? method.`

```ruby
def reverse_string(input)
  # The unless block executes if the conditional returns FALSE
  unless input.respond_to? :reverse # `input` parameter has a method called `reverse`
    raise ArgumentError, "Input cannot be reversed"
  end
  input.reverse
end
```

You can **duplicate** \(almost\) any object by calling its `dup` method. Ruby has its own garbage collector just like Python, which frees the memory associated with any objects that can no longer be referenced.

```ruby
sacred_text = "㊤㊥㊦㊧㊨㊩㊪㊫㊬㊭㊮㊯㊰"
bastardized_text = sacred_text.dup << "lol english" # Here << denotes the append operator

sacred_text != bastardized_text # True
```

---

## Extra: Metaprogramming

Metaprogramming is writing code that can generate more code dynamically at runtime. You can define methods or even classes on the fly, allowing the language itself to be expressed extremely compactly. If you are interested in learning more about metaprogramming, check out this blog post [here](https://www.toptal.com/ruby/ruby-metaprogramming-cooler-than-it-sounds). We will not talk about it more here, but you should understand that leveraging metaprogramming is what allows Rails to do so much for us with so little code. If you can appreciate metaprogramming, then you'll be able to appreciate the Rails framework and all the things that run under the hood.

You'll be seeing a small example of this in the following Ruby lab. Party on.

---

## HW and Quiz

Already know Ruby? Complete the assignment in the next section and pass the tests to continue.

## Additional References

* [https://opensource.com/article/17/4/python-or-ruby-web-development](https://opensource.com/article/17/4/python-or-ruby-web-development)
