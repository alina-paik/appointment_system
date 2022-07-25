class ServicesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_service, only: %i[show update destroy]

    # GET /services
    def index
      @services = Service.where(user_id: current_user.id)
      render json: @services
    end

    # GET /services/:id
    def show
      render json: @service
    end

    # POST /services
    def create
      @service = Service.new(service_create_params)
      if @service.save
         render json: @service, status: :created, location: @service
      else
         render json: @service.errors, status: :unprocessable_entity
      end
    end

    # PUT /services/:id
    def update
      if @service.update(service_update_params)
        render json: @service
      else
        render json: @service.errors, status: :unprocessable_entity
      end
    end

    # DELETE /services/:id
    def destroy
      @service.destroy
    end

    private

    def set_service
      @service = Service.find_by(id: params[:id], user_id: current_user.id)
    end

    def service_create_params
      params.require(:service).permit(:category_id, :name, :descriprion, :duration, :price).merge(user_id: current_user.id)
    end

    def service_update_params
      params.require(:service).permit(:category_id, :duration, :name, :descriprion, :price)
    end
  end
