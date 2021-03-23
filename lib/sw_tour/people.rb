class SwTour::People
    attr_accessor :name, :eye_color, :height

    def initialize(person_info)
        # binding.pry 
    end

    def self.display_people
        SwTour::API.get_people
    end

end