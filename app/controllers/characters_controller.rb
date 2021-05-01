class CharactersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @characters = Character.all
  end
end
