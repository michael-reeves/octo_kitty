class DashboardController < ApplicationController
  before_action :authorize!

  def show
    service ||= current_user.service
    # get the first 3 user that the current user follows
    # and generate a new service
    services = service.follows.first(3).map do |follow|
      Github.new(follow.nickname)
    end

    # for each service, get the first 5 push requests
    @follow_pushes = services.map{ |service| service.pushes.first(5) }.flatten
  end
end
