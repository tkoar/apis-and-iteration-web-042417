require 'rest-client'
require 'json'
require 'pry'



def character_hash
  JSON.parse(RestClient.get('http://www.swapi.co/api/people/'))
end

def next_page
  JSON.parse(RestClient.get(character_hash["next"]))
end

def get_character_movies_from_api(character)
  all_characters = character_hash
  while all_characters["next"] != "null"
    all_characters["results"].each do |character_data|
      if character_data["name"].downcase == character
        return character_data["films"]
      end
    end
    all_characters = next_page
  end
end




  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.

def parse_character_movies(films_hash)
  films_hash.each_with_index do |film_url, index|
    puts "#{index + 1}. #{JSON.parse(RestClient.get(film_url))["title"]}"
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
