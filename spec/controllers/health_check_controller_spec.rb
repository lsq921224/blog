# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthCheckController, type: :controller do
  describe 'GET index' do
    it 'return 200' do
      get :index

      expect(response.status).to eq(200)
    end

    it 'returns 500 if database is not ok' do
      expect(ActiveRecord::Base.connection).to receive(:execute) { raise ActiveRecord::ActiveRecordError }

      get :index

      expect(response.status).to eq(500)
    end
  end
end
