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
      @pet=Pet.new(pet_params)
      @pet.family_id = current_user.families.first.id
      if @pet.save
        redirect_to pets_path, notice: "作成しました"
      else
        render 'new'
      end
    end

    def destroy
        @pet = Pet.find(params[:id])
        @pet.destroy
        redirect_to pets_path, notice:"削除しました"
    end
    
      def update
        @pet = Pet.find(params[:id])
        if @pet.update(pet_params)
          redirect_to pets_path, notice: "編集しました"
        else
          render 'edit'
        end
      end
    

    private

    def pet_params
      params.require(:pet).permit(:name, :content, :start_time)
    end
end
