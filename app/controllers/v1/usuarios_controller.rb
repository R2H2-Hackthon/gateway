module V1
  class UsuariosController < ApplicationController
    before_action :set_usuario, only: [:show, :update, :destroy]

    # GET /usuarios
    def index
      @usuarios = Usuario.all

      render json: @usuarios
    end

    # GET /usuarios/1
    def show
      usuario = @usuario.attributes

      usuario[:avatar] = "https://api.adorable.io/avatars/175/#{ usuario['email'] }"

      render json: usuario
    end

    # POST /usuarios
    def create
      @usuario = Usuario.new(usuario_params)

      if @usuario.save
        render json: @usuario, status: :created
      else
        render json: @usuario.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /usuarios/1
    def update
      if @usuario.update(usuario_params)
        render json: @usuario
      else
        render json: @usuario.errors, status: :unprocessable_entity
      end
    end

    # DELETE /usuarios/1
    def destroy
      @usuario.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_usuario
        @usuario = Usuario.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def usuario_params
        params.fetch(:usuario, {}).permit(
          :nome,
          :sobrenome,
          :dataNascimento,
          :cpf,
          :email,
          :telResidencial,
          :telCelular,
          :logradouro,
          :complemento,
          :cidade,
          :estado,
          :pais,
          :codigoPostal,
        )
      end
  end
end