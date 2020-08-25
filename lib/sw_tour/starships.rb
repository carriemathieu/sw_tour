class SwTour::Starship
    attr_accessor :starship

    @@all = []
    @dark_side = ["Star Destroyer", "Death Star", "TIE Advanced x1", "Executor", "Sentinel-class landing craft"]

    def initialize(starship)
        @starship = starship
        @@all << @starship unless @@all.include?(starship)
    end

    def self.display_starships
        SwTour::API.get_starships
        @@all.each.with_index(1) do |ship, index|
            puts "#{index}. #{ship["name"]}".colorize(:light_green)
        end
    end

    def self.starship_info(ship)
        chosen_starship = @@all[ship - 1]
        if @dark_side.include?(chosen_starship["name"])
            puts "\nLooks like you've chosen the dark side!".colorize(:red)
        else
            puts "\nGreat choice!"
        end
        puts "\nHere's some information about The #{chosen_starship["name"]}:"
        puts "The #{chosen_starship["name"]}'s model is #{chosen_starship["model"]} and was manufactured by #{chosen_starship["manufacturer"]}. The #{chosen_starship["name"]} consists of #{chosen_starship["crew"]} crew members.".colorize(:light_yellow)
    end

    def self.all
        @@all
    end
  
end