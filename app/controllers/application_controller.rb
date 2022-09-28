require 'dotenv/load'

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :get_payment_options
  def get_payment_options
    [['premium', 1], ['amaze', 2]]
  end
end
