Rails.application.config.to_prepare do
  Spina::ApplicationController.class_eval do
    before_action :set_raven_context

    private

    def set_raven_context
      Raven.user_context(id: session[:user_id]) # or anything else in session
      Raven.extra_context(params: params.to_unsafe_h, url: request.url)
    end
  end
end
