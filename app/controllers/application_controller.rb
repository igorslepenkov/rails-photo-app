class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :payment_options
  def payment_options
    [['premium', 1], ['amaze', 2]]
  end
end
