class FamiliesController < ApplicationController
  def index
    @families=Family.all
end

def new
    @family=Family.new
end

def show 
    @family=Family.find(params[:id])
end

def edit
    @family=Family.find(params[:id])
end

def create
  @family=current_user.families.build(family_params)
  @family.user_id = current_user.id
  if @family.save
    redirect_to user_path(current_user), notice: "作成しました"
  else
    render 'new'
  end
end

def destroy
    @family = Family.find(params[:id])
    @family.destroy
    redirect_to families_path, notice:"削除しました"
end

  def update
    @family = Family.find(params[:id])
    if @family.update(family_params)
      redirect_to families_path, notice: "編集しました"
    else
      render 'edit'
    end
  end


private

def family_params
  params.require(:family).permit(:name, :content)
end
end
