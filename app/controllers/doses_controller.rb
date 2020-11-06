class DosesController < ApplicationController
  before_action :set_cocktail, except: %i[destroy]
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail.id), notice: "Your dose was sucessfully created"
    else
      render :new
    end
  end

  def destroy; end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end