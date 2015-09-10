class DashboardController < ApplicationController
  before_action :authorize!

  def show
    # @github = Github.new auth_token: current_user.token
    # @events = @github.activity.events.performed( current_user.nickname )
    # @repos  = @github.repos.list( user: current_user.nickname )

    github = Github.new(current_user.nickname)
    @pull_requests = github.pull_requests
    @user          = github.user
    @repos         = github.repos

# pry
    # events = github.events
    # event_types = {
    #   "PushEvent" => "push",
    # }
    # @events = events.map do |event|
    #   {
    #     action: event_types[event.type],
    #     nickname: event.actor['login']
    #
    #   }
    # end

  end
end
