
# app/controllers/users/confirmations_controller.rb
  module Users
    class ConfirmationsController < Devise::ConfirmationsController
      respond_to :json

      # GET /resource/confirmation?confirmation_token=abcdef
      def show
        self.resource = User.confirm_by_token(params[:confirmation_token])

        yield resource if block_given?

        if resource.errors.empty?
          render json: {email: :confirmed}
        else
          render json: {email: :not_confirmed}
        end
      end

    end
  end
