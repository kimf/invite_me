class InviteMe::ApplicationController < ApplicationController
  before_filter :set_tracking_cookies
  add_flash_types :error, :success

  protected
    def set_tracking_cookies
      cookies[:referring_url] = { value: request.env['HTTP_REFERER'], expires: 90.days.from_now } if cookies[:referring_url].blank?
      cookies[:landing_url] = { value: request.url, expires: 90.days.from_now } if cookies[:landing_url].blank?
    end
end
