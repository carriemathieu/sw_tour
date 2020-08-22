class SwTour::API
    def get_planets
         planets = RestClient.get('https://swapi.dev/api/')
         @planets = JSON.parse(planets)
         binding.pry
    end
end