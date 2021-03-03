class PerformancesController < ApplicationController
  before_action :authenticate_user!,except: [:index]

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
    if @performance.user != current_user
      redirect_to performances_path, alert: "不正なアクセスです。"
    end

  end

  def create
    @performance = Performance.new(performance_params)
    @performance.user_id = current_user.id
    if @performance.save
      redirect_to performance_path(@performance)
    else
      render :new
      
    end
  end

  def update
    @performance = Performance.find(params[:id])
    if @performance.update(performance_params)
      redirect_to performance_path(@performance)
    else
      render :edit
    end
  end


  def destroy
    performance = Performance.find(params[:id])
    performance.destroy
    redirect_to performances_path
  end
  

  private
  def performance_params
    params.require(:performance).permit(:title, :body, :image)
  end

end
