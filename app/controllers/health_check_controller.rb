# frozen_string_literal: true

class HealthCheckController < ApplicationController
  before_action :database_ok?

  def index
    head :ok
  end

  private

  def database_ok?
    ActiveRecord::Base.connection.execute('SELECT 1 FROM SPINA_USERS;')
  rescue ActiveRecord::ActiveRecordError => e
    Rails.logger.error("error checking database state: #{e.message}\n#{e.backtrace.join("\n")}")
    head :internal_server_error
  end
end
