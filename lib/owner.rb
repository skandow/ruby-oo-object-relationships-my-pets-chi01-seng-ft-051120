require 'pry'

class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self 
  end 

  def say_species 
    "I am a #{self.species}."
  end 

  def self.all 
    @@all 
  end 

  def self.count 
    @@all.count 
  end 

  def self.reset_all 
    @@all = []
  end 

  def cats 
    my_cats = Cat.all.select do |cat|
      cat.owner == self  
    end 
    my_cats
  end 

  def dogs 
    my_dogs = Dog.all.select do |dog|
      dog.owner == self
    end 
    my_dogs 
  end 

  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end 

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end 

  def walk_dogs 
    dogs.each do |dog|
      dog.mood = "happy"
    end 
  end 

  def feed_cats 
    cats.each do |cat|
      cat.mood = "happy"
    end 
  end 

  def sell_pets 
    dogs.each do |dog|
      dog.owner = nil 
      dog.mood = "nervous"
    end 
    cats.each do |cat|
      cat.owner = nil 
      cat.mood = "nervous"
    end 
  end 

  def list_pets 
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end 

end