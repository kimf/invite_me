require_dependency "invite_me/application_controller"

module InviteMe
  class RequestsController < ApplicationController
    http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASS'], except: [:new, :create]

    def new
      @request = InviteMe::Request.new
    end

    def create
      @request = InviteMe::Request.new(request_params)
      @request.referring_url = cookies[:referring_url]
      @request.landing_url = cookies[:landing_url]

      if @request.save
        redirect_to root_path, success: "You're request was received"
      else
        flash.now[:error] = "Oops, looks like something went wrong!"
      end
    end

    def index
      @requests = InviteMe::Request.all.order('created_at')
    end


    def invite
      @request = InviteMe::Request.find(find_params)

      if @request.invite
        redirect_to requests_path, success: "Requester invited"
      else
        redirect_to requests_path error: "Oops, looks like something went wrong!"
      end
    end



    private
      def request_params
        params.require(:request).permit(:email)
      end

      def find_params
        params.require(:request_id)
      end

  end
end
