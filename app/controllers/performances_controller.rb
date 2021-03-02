class PerformancesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @performance = Performance.new
  end

  def edit
  end

  def destroy
    performance = Performance.find(params[:id])
    performance.destroy
    redirect_to performances_path
  end

end
