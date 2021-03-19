class SwTour::Planet
    attr_accessor :name, :climate, :terrain, :population
        
    @@all = []

    def initialize(planet_info)
        @name = planet_info["name"]
        @climate = planet_info["climate"]
        @terrain = planet_info["terrain"]
        @population = planet_info["population"]
        @@all << self
    end

    def self.display_planets
        SwTour::API.get_planets if @@all.empty?
        @@all.each.with_index(1) do |planet, index|
            puts "#{index}. #{planet.name}".colorize(:light_green)
        end
    end

    def planet_info
        if self.climate == "frozen"
            puts "\nBrrr... I hope you brought some warm clothes!".colorize(:light_blue)
        elsif self.climate == "temperate"
            puts "\nLooks like we have some great weather!".colorize(:light_red)
        elsif self.terrain.include?("swamp") || self.terrain.include?("jungle")
            puts "\nIt might be a bit muddy!".colorize(:green)
        end

        puts "\n\u{1F4AB} Chewie says we're ready. Off we go! While we're on our way, here is some information about #{self.name}: "
        puts "Climate: #{self.climate}".colorize(:light_yellow)
        puts "Terrain: #{self.terrain}".colorize(:light_yellow)
        puts "Population: #{self.population}".colorize(:light_yellow)
        sleep(5)
        puts "\n\u{1F320} Welcome to #{self.name}! \u{1F320}"
        puts "  
*    .  *       .       *
            *      .        .   *
*   .        *       .       .       *
                    .     *             .
.     .  *        *                 .
    .                .        .
        .  *           *          *
 .                                 .
    *          .   *"

            #This ASCII pic can be found at
            #https://asciiart.website/index.php?art=nature/astronomy

        SwTour::CLI.travel_again?
    end

    def self.all
        @@all
    end
    
end
