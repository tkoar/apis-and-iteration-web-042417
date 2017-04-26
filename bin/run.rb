#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
choice = get_choice_from_user
if choice == "movie"
  character = get_character_from_user
  category = get_category
else
  character = get_character_from_user
end
show_character_movies(choice, character, category)
