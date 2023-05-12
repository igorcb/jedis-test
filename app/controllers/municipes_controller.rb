class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[edit update]

  def index
    @municipes = Municipe.all
  end

  def new
    @municipe = Municipe.new
    @municipe.build_address
  end

  def edit; end

  def create
    @municipe = Municipe.new(municipe_params)

    if @municipe.save
      redirect_to municipes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @municipe.update(municipe_params)
      redirect_to municipes_path
    else
      redirect_to action: :edit
    end
  end

  private

  def set_municipe
    @municipe = Municipe.find(params[:id])
  end

  def municipe_params
    params.require(:municipe).permit(
      :name,
      :cpf,
      :cns,
      :email,
      :phone,
      :birth_date,
      address_attributes: %i[
        id zip_code street number complement neighborhood city
        state code_ibge
      ],
    )
  end
end
