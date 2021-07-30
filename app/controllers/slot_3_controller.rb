class Slot3Controller < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :destroy]

  def new

  end

  def create

  end

  def destroy

  end
end
