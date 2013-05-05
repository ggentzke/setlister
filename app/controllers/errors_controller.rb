class ErrorsController < ApplicationController
  before_filter :log_exception

  def not_found
    render 'not_found', :status => 404
  end

  def error
    render 'error', :status => 500
  end

  protected
  def log_exception
    Rails.logger.error "Exception: #{env['action_dispatch.exception']}"
  end
end
