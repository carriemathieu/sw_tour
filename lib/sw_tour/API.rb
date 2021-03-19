class SwTour::API

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

end

# def self.get_api_info(item)
#     items = RestClient.get("https://www.swapi.tech/api/#{item}/")
#     @items = JSON.parse(items)
#     @items["results"].each do |item|
#         id = item["uid"].to_i
#         info = RestClient.get("https://www.swapi.tech/api/${item}/#{id}")
#         item_info = JSON.parse(info)["result"]["properties"]

#         SwTour::Planet.new(item_info) // need to change item to cap
#     end
# end