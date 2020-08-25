class SwTour::Planet
        
    @@all = []
    #@dark_side = ["Star Destroyer", "Death Star", "TIE Advanced x1", "Executor", "Sentinel-class landing craft"]

    def initialize(planet)
        @planet = planet
        @@all << @planet unless @@all.include?(planet)
    end

    def self.display_planets
        SwTour::API.get_planets
        @@all.each.with_index(1) do |planet, index|
            puts "#{index}. #{planet["name"]}".colorize(:light_green)
        end
    end

    def self.planet_info(planet)
        chosen_planet = @@all[planet - 1]
        #binding.pry
        if chosen_planet["climate"] == "frozen"
            puts "\nBrrr... I hope you brought some warm clothes!".colorize(:light_blue)
        elsif chosen_planet["climate"] == "temperate"
            puts "\nLooks like we have some great weather!".colorize(:light_red)
        elsif chosen_planet["terrain"].include?("swamp") || chosen_planet["terrain"].include?("jungle")
            puts "\nIt might be a bit muddy!".colorize(:green)
        end

        puts "\n\u{1F4AB} Chewie says we're ready. Off we go! While we're on our way, here is some information about #{chosen_planet["name"]}: "
        puts "Climate: #{chosen_planet["climate"]}".colorize(:light_yellow)
        puts "Terrain: #{chosen_planet["terrain"]}".colorize(:light_yellow)
        puts "Population: #{chosen_planet["population"]}".colorize(:light_yellow)
        sleep(5)
        puts "\n\u{1F320} Welcome to #{chosen_planet["name"]}! \u{1F320}"
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