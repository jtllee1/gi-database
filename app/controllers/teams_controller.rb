class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create, :destroy]

  def index
    @teams = Team.all
  end

  def new
    @slotsA = SlotA.all
    @slotsB = SlotB.all
    @slotsC = SlotC.all
    @slotsD = SlotD.all
    @team = Team.new
  end

  def create
    @team = Team.new
    @team.slot_a_id = params[:team][:slot_a]
    @team.slot_b_id = params[:team][:slot_b]
    @team.slot_c_id = params[:team][:slot_c]
    @team.slot_d_id = params[:team][:slot_d]
    if @team.save
      redirect_to teams_path
    else
      render :new
    end
  end

  def destroy
    find_team
    @team.destroy
    redirect_to teams_path
  end

  private

  def team_params
    params.require(:team).permit(:slot_a, :slot_b, :slot_c, :slot_d)
  end

  def find_team
    @team = Team.find(params[:id])
  end
end
