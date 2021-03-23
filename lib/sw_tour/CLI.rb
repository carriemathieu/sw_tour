#!/usr/bin/env ruby
class SwTour::CLI
    
    # app flow

    # start
    def self.start
        puts "\n☆.。.:*・°☆.。.:*・°☆.。.:*・°☆.。.:*・°"
        puts "\n\u{1F680} Welcome to Star Wars Travel Agency! \u{1F916}"
        puts "*****************************************"
        puts "\nChewie will be your pilot today! Which spaceship will you be using?"
        starship
    end

    # displays starship info
    def self.starship
        SwTour::Starship.display_starships
        puts "\nPlease enter the number for your selected spaceship."
        get_ship
    end

    # prompts user for input
    def self.get_ship
        input = gets.chomp
        ship = input.to_i
        display_starship_info(ship)
    end

    # checks to make sure number chosen is valid, directs to get_people
    def self.display_starship_info(ship)
        if ship <= SwTour::Starship.all.length && ship > 0
            chosen_starship = SwTour::Starship.all[ship - 1]
            chosen_starship.starship_info
        else
            puts "Please enter a valid input."
            get_ship
        end
        sleep(3)
        puts "\nYou get to pick a travel companion! Who would you like to take with you?"
        people
    end

    # gets people info
    def self.people
        SwTour::People.display_people
        get_people
    end

    # prompts user for input
    def self.get_people
        input = gets.chomp
        person = input.to_i
        display_people_info(person)
    end
    
    # validates input
    def self.display_people_info(person)
        if person <= SwTour::People.all.length && person > 0
            chosen_person = SwTour::People.all[person-1]
            chosen_person.person_info
        else
            "Please enter a valid number:"
            get_people
        end
        planets
    end

    def self.planets
        SwTour::Planet.display_planets
        get_planet
    end

    def self.get_planet
        input = gets.chomp
        planet = input.to_i
        display_planet_info(planet)
    end

    def self.display_planet_info(planet)
        if planet <= SwTour::Planet.all.length && planet > 0
            chosen_planet = SwTour::Planet.all[planet - 1]
            chosen_planet.planet_info
        else
            puts "Please enter a valid input."
            get_planet
        end
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