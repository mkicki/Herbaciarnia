class TeasController < ApplicationController

  def index
    @teas = Tea.all
  end

  def create
    @tea = Tea.new(user_params)

    if @tea.save
      flash[:notice] = "Tea was succesfully created"
      redirect_to user_path(@tea)
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
    flash[:notice] = "Author was successfully deleted"

    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password_digest)
  end



end