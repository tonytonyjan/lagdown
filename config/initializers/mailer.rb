Lagdown::Application.configure do
  Settings.action_mailer.each do |key, value|
    config.action_mailer.send("#{key}=", value.symbolize_keys)
  end
end
ActionMailer::Base.register_interceptor(SandboxMailInterceptor) if Rails.env.development?