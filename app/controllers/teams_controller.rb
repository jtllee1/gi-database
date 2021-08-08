class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create, :destroy]

  def index
    @teams = Team.all
    @slots = SlotA.all
  end

  def new
    @team = Team.new
  end

  def create

  end

  def destroy

  end
end
