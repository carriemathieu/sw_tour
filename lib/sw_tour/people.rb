class SwTour::People
    attr_accessor :name, :eye_color, :height, :gender

    @@all = []

    def initialize(person_info)
        @name = person_info["name"]
        @height = person_info["height"]
        @gender = person_info["gender"]
        @eye_color = person_info["eye_color"]
        @@all << person_info
    end

    def self.display_people
        SwTour::API.get_people if @@all.empty?
        @@all.each.with_index(1) do |person, index|
            puts "#{index}. #{person["name"]}".colorize(:light_white)
        end
    end

    def self.all
        @@all
    end

end