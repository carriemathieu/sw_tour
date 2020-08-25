class SwTour::API

    def self.get_starships
        starships = RestClient.get('https://swapi.dev/api/starships/')
        @starship = JSON.parse(starships)
        @starship["results"].each do |ship|
            SwTour::Starship.new(ship)
        end
    end

    def self.get_planets
        planets = RestClient.get("https://swapi.dev/api/planets/")
        @planets = JSON.parse(planets)
        #@starship["results"].each do |ship|
         #   SwTour::Starship.new(ship)
    end

end