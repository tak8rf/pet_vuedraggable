class PetsController < ApplicationController
    def index
        @pets=Pet.all
    end

    def new
        @pet=Pet.new
    end

    def show 
        @pet=Pet.find(params[:id])
    end

    def edit
        @pet=Pet.find(params[:id])
    end

    def create
        Pet.create(pet_parameter)
        redirect_to pets_path
    end

    def destroy
        @pet = Pet.find(params[:id])
        @pet.destroy
        redirect_to pets_path, notice:"削除しました"
    end
    
      def update
        @pet = Pet.find(params[:id])
        if @pet.update(pet_parameter)
          redirect_to pets_path, notice: "編集しました"
        else
          render 'edit'
        end
      end
    

    private

    def pet_parameter
      params.require(:pet).permit(:name, :content, :start_time)
    end
end
