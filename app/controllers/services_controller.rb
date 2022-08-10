# frozen_string_literal: true

class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service, only: %i[show update destroy]

  # GET /sevices?page=:page
  def index
    services = Services::Search.call(user_id: current_user.id, page: params[:page])
    render json: services
  end

  # GET /services/:id
  def show
    render json: @service
  end

  # POST /services
  def create
    result = Services::Create.call(**service_create_params)
    if result[:result]
      service = result[:result]
      render json: service, status: :created, location: service
    else
      errors = result[:errors]
      render json: errors, status: :unprocessable_entity
    end
  end

  # PUT /services/:id
  def update
    result = Services::Update.call(**service_update_params.merge(object: @service))
    if result[:result]
      service = result[:result]
      render json: service, status: :created, location: service
    else
      errors = result[:errors]
      render json: errors, status: :unprocessable_entity
    end
  end

  # DELETE /services/:id
  def destroy
    @service.destroy
  end

    private
      def set_service
        @service = Services::FindService.call(user_id: current_user.id, id: params[:id])
      end

      def service_create_params
        params.require(:service).permit(:category_id, :name, :descriprion, :duration,
          :price).merge(user_id: current_user.id).to_h.symbolize_keys
      end

      def service_update_params
        params.require(:service).permit(:category_id, :duration, :name, :descriprion, :price).to_h.symbolize_keys
      end
end
