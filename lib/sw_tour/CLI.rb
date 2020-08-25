#!/usr/bin/env ruby
class SwTour::CLI
    def self.begin
        puts "\u{1F680}  Welcome to Star Wars Travel Agency! \u{1F916}"
        puts "*****************************************"
        puts "\nI hope you brought your bags and are ready to travel! Which spaceship would you like to use?" 
        spaceship
    end

    def self.spaceship
        #SwTour::API.get_starships
        SwTour::Starships.display_starships
        #displays options for space ship from 1-10
        #stores this info for API to use
    end
end