#!/usr/bin/env ruby
class SwTour::CLI
    
    def self.begin
        puts "\n☆.。.:*・°☆.。.:*・°☆.。.:*・°☆.。.:*・°"
        puts "\n\u{1F680} Welcome to Star Wars Travel Agency! \u{1F916}"
        puts "*****************************************"
        puts "\nChewie will be your pilot today! Which spaceship will you be using?"
        starship
    end

    def self.starship
        SwTour::Starship.display_starships
        puts "Please enter the number for your selected spaceship."
        get_starship
    end

    def self.get_starship
        input = gets.chomp
        ship = input.to_i
        display_starship_info(ship)
    end

    def self.display_starship_info(ship)
        if ship < SwTour::Starship.all.length + 1 && ship > 0
            SwTour::Starship.starship_info(ship)
        else
            puts "Please enter a valid input."
            get_starship
        end
    end


    
    #def self.planets

    #end
end