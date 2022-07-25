class SpecialistServicesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_specialist_service, only: %i[show update destroy]

    # GET /specialist_services
    def index
      @specialist_services = SpecialistService.where(user_id: current_user.id)
      render json: @specialist_services
    end

    # GET /specialist_services/:id
    def show
      render json: @specialist_service
    end

    # POST /specialist_services
    def create
      @specialist_service = SpecialistService.new(specialist_service_create_params)
      if @specialist_service.save
         render json: @specialist_service, status: :created, location: @specialist_service
      else
         render json: @specialist_service.errors, status: :unprocessable_entity
      end
    end

    # PUT /specialist_services/:id
    def update
      if @specialist_service.update(specialist_service_update_params)
        render json: @specialist_service
      else
        render json: @specialist_service.errors, status: :unprocessable_entity
      end
    end

    # DELETE /specialist_services/:id
    def destroy
      @specialist_service.destroy
    end

    private

    def set_specialist_service
      @specialist_service = SpecialistService.find_by(id: params[:id], user_id: current_user.id)
    end

    def specialist_service_create_params
      params.require(:specialist_service).permit(:service_id, :duration).merge(user_id: current_user.id)
    end

    def specialist_service_update_params
      params.require(:specialist_service).permit(:duration)
    end
  end
