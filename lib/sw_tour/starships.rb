class SwTour::Starship
    attr_accessor :starship, :name, :model, :manufacturer, :crew

    @@all = []
    @@dark_side = ["Star Destroyer", "Death Star", "TIE Advanced x1", "Executor", "Sentinel-class landing craft"]

    def initialize(ship_info)
        @name = ship_info["name"]
        @model = ship_info["model"]
        @manufacturer = ship_info["manufacturer"]
        @crew = ship_info["crew"]
        @@all << self
    end

    def self.display_starships
        SwTour::API.get_starships if @@all.empty?
        @@all.each.with_index(1) do |ship, index|
            puts "#{index}. #{ship.name}".colorize(:light_green)
        end
    end

    def starship_info
        if @@dark_side.include?(self.name)
            puts "\nLooks like you chose the dark side!".colorize(:red)
        else
            puts "\nGreat choice!"
        end
        puts "\nHere's some information about The #{self.name}:" 
        puts "The #{self.name}'s model is #{self.model} and was manufactured by #{self.manufacturer}. The #{self.name} consists of #{self.crew} crew members.".colorize(:light_yellow)
    end

    def self.all
        @@all
    end
  
end
