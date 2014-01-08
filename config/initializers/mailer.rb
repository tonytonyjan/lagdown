Lagdown::Application.configure do
  config.action_mailer.default_url_options = {host: Settings.host}
  config.action_mailer.smtp_settings = Settings.smtp_settings.to_options
end
ActionMailer::Base.register_interceptor(SandboxMailInterceptor) if Rails.env.development?