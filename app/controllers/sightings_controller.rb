class SightingsController < ApplicationController
    def show
        @sighting = Sighting.find(params[:id])
        render json: @sighting.to_json(:include => {:bird => {:only =>[:name, :species]}, :location => {:only =>[:latitude, :longitude]}}, :except => [:updated_at])
    end

    def index
        sightings = Sighting.all
        render json: SightingSerializer.new(sightings).to_serialized_json
        # use service class and seraialized method to refactor the controller to be more DRY
        # render json: sightings.to_json(:include => {
        #   :bird => {:only => [:name, :species]},
        #   :location => {:only => [:latitude, :longitude]}
        # }, :except => [:updated_at])
      end
end
