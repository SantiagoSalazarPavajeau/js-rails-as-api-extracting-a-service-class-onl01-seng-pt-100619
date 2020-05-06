class SightingSerializer

    def initialize(sighting_object)
    #    make an instance variable to share over multiple methods (in this case multiple actions)
        @sighting = sighting_object
    end

    def to_serialized_json
        # rewrite hash/json for more readability
        options = {
            include: {
              bird: {
                only: [:name, :species]
              },
              location: {
                only: [:latitude, :longitude]
              }
            },
            except: [:updated_at],
          }
        @sighting.to_json(options)
        
        # handle inclusion and exlusion of attributes
        # @sighting.to_json(:include => {
        #   :bird => {:only => [:name, :species]},
        #   :location => {:only => [:latitude, :longitude]}
        # }, :except => [:updated_at])
    end


end