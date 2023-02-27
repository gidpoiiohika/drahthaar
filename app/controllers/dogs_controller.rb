class DogsController < ApplicationController
  before_action :set_dog, only: %i[ show edit update destroy ]

  def index
    @q = Dog.ransack(params[:q])
    @dogs = @q.result(distinct: true)
  end

  def show; end

  def new
    @dog = Dog.new
  end

  def edit; end

  def create
    @dog = Dog.new(dog_params)

    if @dog.save
      redirect_to dog_url(@dog), notice: 'Dog was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @dog.update(dog_params)
      redirect_to dog_url(@dog), notice: 'Dog was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dog.destroy

    redirect_to dogs_url, notice: "Dog was successfully destroyed."
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :description, :father, :mother, :stigma)
  end
end
