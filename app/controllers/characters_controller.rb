class CharactersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @characters = Character.all

    if params[:element].present?
      @filter = []

      @characters.each do |character|
        if character.element == params[:element]
          @filter << character
        end
      end

      @characters = @filter
    end
  end

  def show
    @character = Character.find(params[:id])
  end

  private

  def character_params
    params.require(:character).permit(:element)
  end
end
