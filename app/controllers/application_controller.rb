class ApplicationController < ActionController::Base
  require 'securerandom'
  protect_from_forgery with: :exception
  include  DocumentsHelper
  include  UsersHelper
end
