class SwTour::People
    attr_accessor :name, :eye_color, :height, :gender

    @@all = []

    def initialize(person_info)
        @name = person_info["name"]
        @height = person_info["height"]
        @gender = person_info["gender"]
        @eye_color = person_info["eye_color"]
        @@all << self
    end

    def self.display_people
        SwTour::API.get_people if @@all.empty?
        @@all.each.with_index(1) do |person, index|
            puts "#{index}. #{person.name}".colorize(:light_white)
        end
    end

    def person_info
        if self.name == "Darth Vader"
            puts "\nOH NO! Darth Vader has run off with your ship! :(.".colorize(:white).bold.on_red
            puts "\nLooks like we'll have to choose again.What ship will you choose this time?\n\n"
            SwTour::CLI.starship
        else
            puts "very good choice!"
            puts "Time to choose your destination:"
        end
    end

    def self.all
        @@all
    end

end