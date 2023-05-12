class MunicipesController < ApplicationController
  def index
    @municipes = Municipe.all
  end

  def new
    @municipe = Municipe.new
  end

  def create
    @municipe = Municipe.new(municipe_params)

    if @municipe.save
      redirect_to municipes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def municipe_params
    params.require(:municipe).permit(:name, :cpf, :cns, :email, :phone, :birth_date)
  end
end
