class SwTour::API

    # gets starships from API, parses data & nested data, instantiates new object in Starship class
    def self.get_starships
        starships = RestClient.get('https://www.swapi.tech/api/starships/')
        @starship = JSON.parse(starships)
        @starship["results"].each do |ship|
            id = ship["uid"].to_i
            info = RestClient.get("https://www.swapi.tech/api/starships/#{id}")
            ship_info = JSON.parse(info)["result"]["properties"]
            SwTour::Starship.new(ship_info)
        end
    end

    # gets planets from API, parses data & nested data, instantiates new object in Starship class
    def self.get_planets
        planets = RestClient.get("https://www.swapi.tech/api/planets/")
        @planets = JSON.parse(planets)
        @planets["results"].each do |planet|
            id = planet["uid"].to_i
            info = RestClient.get("https://www.swapi.tech/api/planets/#{id}")
            planet_info = JSON.parse(info)["result"]["properties"]
            SwTour::Planet.new(planet_info)
        end
    end

    # gets people from API, parses data & nested data, instantiates new object in Starship class
    def self.get_people
        people = RestClient.get("https://www.swapi.tech/api/people/")
        @people = JSON.parse(people)
        @people["results"].each do |person|
            id = person["uid"].to_i
            info = RestClient.get("https://www.swapi.tech/api/people/#{id}")
            person_info = JSON.parse(info)["result"]["properties"]
            SwTour::People.new(person_info)
        end
    end
end
