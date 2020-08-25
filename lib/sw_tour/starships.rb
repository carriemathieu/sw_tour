class SwTour::Starships
    attr_accessor :starship

    @@all = []

    def initialize(spaceship)
        @spaceship = spaceship.new
    end

    def self.display_starships
        #binding.pry
        SwTour::API.get_starships
        #binding.pry
        @starship["results"].each.with_index(1) do |ship, index|
            puts "#{index}. #{ship["name"]}".colorize(:light_blue)
        end
    end
end