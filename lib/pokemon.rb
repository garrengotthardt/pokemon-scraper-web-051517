require "pry"

class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(pokemon_hash)
    @name = pokemon_hash[:name]
    @type = pokemon_hash[:type]
    @db = pokemon_hash[:db]
    @id = pokemon_hash[:id]
    #binding.pry
  end


  def self.save(name, type, db)
    #binding.pry
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);",name, type)
  end

  def self.find (id, db)
    poke_array = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?;", id)[0]
    new_poke_hash = { id:poke_array[0], name: poke_array[1], type: poke_array[2]}
    Pokemon.new(new_poke_hash)
  end
end
