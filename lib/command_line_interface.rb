def welcome
  puts "Hey, welcome to our star-wars movie database! you can search for movies by character or you can search for movie information by movie title."
end

def get_choice_from_user
  puts "Please choose 'character' or 'movie'"
  gets.downcase.chomp
end

def get_character_from_user
  puts "please enter a character/movie name"
  gets.downcase.chomp
end

def get_category
  puts "available categories: title, episode_id, opening_crawl, director, producer, release_date, characters"
  puts "please enter a category name"
  gets.downcase.chomp
end
