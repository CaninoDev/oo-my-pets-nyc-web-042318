require 'pry'
class Owner
  attr_accessor :name, :pets
  attr_reader :species
  ALL = []

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {fishes: [], dogs: [], cats: []}
    ALL << self
  end

  def self.all
    ALL
  end

  def self.reset_all
    ALL.clear
  end

  def self.count
    ALL.length
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |species, pet|
      pet.each do |animal|
        animal.mood = "nervous"
      end
    end
    @pets.clear
  end

  def list_pets
    quanti_array = []
    anim_species = ["fish", "dog(s)", "cat(s)"]
    @pets.each do |type, pet|
      quanti_array << pet.length
    end
    "I have #{quanti_array.shift} #{anim_species.shift}, #{quanti_array.shift} #{anim_species.shift}, and #{quanti_array.shift} #{anim_species.shift}."
  end
end
