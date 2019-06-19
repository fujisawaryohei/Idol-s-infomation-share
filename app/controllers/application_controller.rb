require 'securerandom'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception #CSRF
  include SessionsHelper
  include UsersHelper
end
