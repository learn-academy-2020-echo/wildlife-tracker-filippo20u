class AnimalsController < ApplicationController

# storing the animals content
    def index
        animals = Animal.all
        # render json of our variable students
        render json: animals
    end

# WORKING METHOD
    # def show
    #     animal = Animal.find (params[:id])
    #     # render json: animal
    #
    # end


    def create
        animal = Animal.create(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end
    end


    def destroy
      animal = Animal.find(params[:id])
      if animal.destroy
        render json: animal
      else
        render json: animal.errors
      end
    end

    def update
        animal = Animal.find(params[:id])
        animal.update(animal_params)
        if animal.valid?
          render json: animal
        else
          render json: animal.errors
        end
    end


# Wed adictions

def show
    animal = Animal.find(params[:id])
    render json: animal.sightings

end


class SightingsController < ApplicationController
  def index
    sightings = Sighting.where(start_date: params[:start_date]..params[:end_date])
    render json: sightings
  end
end

Remember to add the start_date and end_date to what is permitted in your strong parameters method.

# Strong params

    private
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :kingdom )
    end







end
