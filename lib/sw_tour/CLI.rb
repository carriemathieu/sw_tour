#!/usr/bin/env ruby
class SwTour::CLI
    
    ## app flow

    # start
    def self.start
        puts "\n☆.。.:*・°☆.。.:*・°☆.。.:*・°☆.。.:*・°"
        puts "\n\u{1F680} Welcome to Star Wars Travel Agency! \u{1F916}"
        puts "*****************************************"
        puts "\nChewie will be your pilot today! Which spaceship will you be using?"
        starship
    end

    def self.starship
        # gets starship info from API
        SwTour::Starship.display_starships
        puts "\nPlease enter the number for your selected spaceship."

        # prompts user for input
        input = gets.chomp
        ship = input.to_i

        # checks to make sure input is valid
        until ship <= SwTour::Starship.all.length && ship > 0
            puts "Please enter a valid number."
            input = gets.chomp
            ship = input.to_i
        end
        
        # gets info for starship from input
        chosen_starship = SwTour::Starship.all[ship - 1]
        chosen_starship.starship_info
        
        # allocates time to read starship info
        sleep(3)
        puts "\nYou get to pick a travel companion! Who would you like to take with you?"
        people
    end

    def self.people
        # gets people info from API
        SwTour::People.display_people

        # prompts user for input
        input = gets.chomp
        person = input.to_i

        # checks to make sure input is valid
        until person <= SwTour::People.all.length && person > 0
            puts "Please enter a valid number."
            input = gets.chomp
            person = input.to_i
        end
        
        # gets info for person from input
        chosen_person = SwTour::People.all[person-1]
        chosen_person.person_info
        
        planets
    end

    def self.planets
        # gets planet info from API
        SwTour::Planet.display_planets
        
        # gets planet input
        input = gets.chomp
        planet = input.to_i

        # validates planet info
        until planet <= SwTour::Planet.all.length && planet > 0
            puts "Please enter a valid number."
            input = gets.chomp
            planet = input.to_i
        end

        # gets info for planet from input
        chosen_planet = SwTour::Planet.all[planet - 1]
        chosen_planet.planet_info
    end

    def self.travel_again?
        puts "Would you like to travel again? Please input 'yes' to travel again or 'exit' to exit."
        input = gets.chomp.downcase
        if input == "yes"
            start
        elsif input == "exit"
            goodbye
        else
            puts "Please enter 'yes' or 'exit' "
            travel_again?
        end
    end

    def self.goodbye
        puts "We'll see you next time!"
        exit(true)
    end
end