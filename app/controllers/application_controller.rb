class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  include SessionsHelper

  def default_url_options
    { host: ENV['HOST'] || 'localhost:3000' }
  end

  # def default_url_options
  #   if Rails.env.production?
  #     { host: "tesnorcarly.herokuapp.com" }
  #   else
  #     {}
  #   end
  # end
end
