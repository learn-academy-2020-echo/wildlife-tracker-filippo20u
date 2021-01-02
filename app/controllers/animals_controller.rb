class AnimalsController < ApplicationController

# storing the animals content
    def index
        animals = Animal.all
        # render json of our variable animals
        render json: animals
    end



# Wed adictions (Story 8)

  
    def show
      animal = Animal.find_by(id: params[:id]).sightings
      render json: animal
    end


# initial Show method before story 8
    # def show
    #     animal = Animal.find (params[:id])
    #     render json: animal
    # end



# Working methods:


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



# Strong params

    private
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :kingdom, :start_date, :end_date )
    end


end
