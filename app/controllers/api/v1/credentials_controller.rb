module Api::V1
  class CredentialsController < ApiController
    before_action :doorkeeper_authorize!

    def me
      render json: {
        provider: 'NurseTim',
        uid: SecureRandom.uuid,
        info: {
          first_name: 'John',
          last_name: 'Doe',
          email: current_resource_owner.email
        },
        extra: {
          product_ids: %i[1 2 3 4 5]
        }
      }.to_json
    end

  end
end
