class SightingsController < ApplicationController

      # Story 9

      # def index
      #   sightings = Sighting.where(start_date: params[:start_date],params[:end_date])
      #   render json: sightings.where/[:start_date]/[:end_date]
      # end


      # working index
      def index
          sighting = Sighting.all
          render json: sighting
      end

      def show
          sighting = Sighting.find (params[:id])
          render json: sighting
      end


      def create
          sighting = Sighting.create(sighting_params)
          if sighting.valid?
              render json: sighting
          else
              render json: sighting.errors
          end
      end


      def destroy
          sighting = Sighting.find(params[:id])
        if sighting.destroy
          render json: sighting
        else
          render json: sighting.errors
        end
      end

      def update
          sighting = Sighting.find(params[:id])
          sighting.update(sighting_params)
          if sighting.valid?
            render json: sighting
          else
            render json: sighting.errors
          end
      end



      private

      # working strong params
      def sighting_params
          params.require(:sighting).permit(:datetime, :latitude, :longitude)
      end


      # Updated  strong params for Story ( Amanda )
      # def sighting_params
      #     params.require(:sighting).permit(:datetime, :latitude, :longitude, :start_date , :end_date )
      # end


end
