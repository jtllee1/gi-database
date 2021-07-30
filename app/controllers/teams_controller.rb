class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create, :destroy]

  def index
    @teams = Team.all
  end

  def new

  end

  def create

  end

  def destroy

  end
end
