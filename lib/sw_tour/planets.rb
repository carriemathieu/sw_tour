class SwTour::Planet
        
    @@all = []
    #@dark_side = ["Star Destroyer", "Death Star", "TIE Advanced x1", "Executor", "Sentinel-class landing craft"]

    def initialize(planet)
        @planet = planet
        @@all << @planet
    end

    def self.display_planets
        SwTour::API.get_planets
        @@all.each.with_index(1) do |planet, index|
            puts "#{index}. #{planet["name"]}".colorize(:light_blue)
        end
    end

    #def self.starship_info(ship)
      #  chosen_starship = @@all[ship - 1]
        #binding.pry
        #if @dark_side.include?(chosen_starship["name"])
        #    puts "\nLooks like you've chosen the dark side!".colorize(:red)
       # else
      #      puts "\nGreat choice!"
     #   end
    #    puts "\nThe #{chosen_starship["name"]}'s model is #{chosen_starship["model"]} and was manufactured by #{chosen_starship["manufacturer"]}. The #{chosen_starship["name"]} consists of #{chosen_starship["crew"]} crew members."
    #end

    def self.all
        @@all
    end
    
end