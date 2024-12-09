class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_recipe, only: [ :show, :edit, :update, :destroy ]
  def index
    @recipes = if params[:search]
      Recipe.where("title LIKE ?", "%#{params[:search]}%")
    else
     Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to(@recipe, notice: "Recipe was successfully created!")
    else
      render(:new)
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe was updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: "Recipe was successfully deleted!"
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :instructions, :image)
  end
end
