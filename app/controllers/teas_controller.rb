class TeasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @teas = Tea.all
  end

  def create
    @tea = Tea.new(tea_params)

    if @tea.save
      flash[:notice] = "Tea was succesfully created"
      redirect_to tea_path(@tea)
    else
      render 'new'
    end

  end

  def new
    @tea = Tea.new
  end

  def edit
    @tea = Tea.find(params[:id])
  end

  def update
    @tea = Tea.find(params[:id])

    render 'edit'

  end

  def show
    @tea = Tea.find(params[:id])
  end

  def destroy
    @tea = Tea.find(params[:id])
    @tea.destroy
    flash[:notice] = "Tea was successfully deleted"

    redirect_to teas_path
  end

  private
  def tea_params
    params.require(:tea).permit(:name, :country, :kind)
  end



end