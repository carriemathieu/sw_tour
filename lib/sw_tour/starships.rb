class SwTour::Starships
    attr_accessor :name, :API, :starship
    
    @@all = []

    def initialize(starship)
        get_starships
        @starship.each {|starship, descriptions| self.send(("#{starship}="), descriptions)}
        @@all << self
    end

    def self.all
        @@all
    end

    def self.display_starships
        #binding.pry
        @@all.each.with_index(1) do |index, ship|
            puts "#{index}, #{ship}"
        end
    end
end