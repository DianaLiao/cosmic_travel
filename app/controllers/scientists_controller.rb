class ScientistsController < ApplicationController

  def index
    @scientists = Scientist.all
  end

  def show
    set_scientist
  end

  def new
    @scientist = Scientist.new
  end

  def create
    scientist = Scientist.create(scientist_params)

    if scientist.valid?
      redirect_to scientist_path(scientist)
    else
      flash[:errors] = scientist.errors.full_messages
      redirect_to new_scientist_path
    end
  end

  def edit
    set_scientist
  end

  def update
    set_scientist

    if @scientist.update(scientist_params)
      redirect_to scientist_path(@scientist)
    else
      flash[:errors] = @scientist.errors.full_messages
      redirect_to edit_scientist_path(@scientist)
    end
  end

  def destroy
    set_scientist
    @scientist.destroy

    redirect_to scientists_path
  end


  private

  def set_scientist
    @scientist = Scientist.find(params[:id])
  end

  def scientist_params
    params.require(:scientist).permit(:name, :field_of_study)
  end
end
