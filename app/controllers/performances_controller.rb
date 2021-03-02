class PerformancesController < ApplicationController
  def index
    @performances = Performance.all
  end

  def show
    @performance = Performance.find(params[:id])
  end

  def new
    @performance = Performance.new
  end

  def edit
    @performance = Performance.find(params[:id])

  end

  def create
    @performance = Performance.new(performance_params)
    @performance.user_id = current_user.id
    @performance.save
    redirect_to performance_path(@performance)
  end

  def update
    @performance = Performance.find(params[:id])
    @performance.update(performance_params)
    redirect_to performance_path(@performance)
  end


  def destroy
    performance = Performance.find()params[:id]
    performance.destroy
    redirect_to performances_path

  private
  def performance_params
    params.require(:performance).permit(:title, :body, :image)
  end

end
