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
            puts "#{index}. #{person.name}".colorize(:light_green)
        end
    end

    def person_info
        if self.name == "Darth Vader"
            puts "\n\u{1F6A8} OH NO! Darth Vader has run off with your ship! :(.".colorize(:white).bold
            puts "\nLooks like we'll have to choose another ship. What ship will you choose this time?\n\n"
            SwTour::CLI.starship
        else
            puts "#{self.name} - good choice! First we'll need to go pick up your companion then we'll head to your final destination.\n"
            puts "Keep an eye out for your companion! This is what you should look for: \n".colorize(:magenta)
            puts "Gender: #{self.gender}\n"
            puts "Height: #{self.height}cm\n"
            puts "Eye Color: #{self.eye_color}\n"
            puts "***************************************************"
            puts "\u{1F311} \u{1F312} \u{1F313} \u{1F314} \u{1F315} \u{1F316} \u{1F317} \u{1F318}"
            puts "***************************************************"
            sleep(5)
            puts "Perfect! We have picked up #{self.name}! \n\n"
            puts "Time to choose your destination:\n"
        end
    end

    def self.all
        @@all
    end

end