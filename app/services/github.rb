require_relative '../presenters/pull_request_event'

class Github
  def initialize(username)
    @username = username
  end

  def events
    @events ||= begin
      response = HTTParty.get("https://api.github.com/users/#{@username}/events?per_page=100")

      JSON.parse(response.body).map do |event|
        OpenStruct.new(event)
      end
    end
  end

  def pull_requests
    pull_requests = events.find_all do |event|
      event.type == 'PullRequestEvent'
    end

    pull_requests.map{ |r| PullRequestEvent.new(r) }
  end

  def repos
    response = HTTParty.get("https://api.github.com/users/#{@username}/repos?per_page=100")

    JSON.parse(response.body).map do |repo|
      OpenStruct.new(repo)
    end
  end

  def user
    response = HTTParty.get("https://api.github.com/users/#{@username}")

    OpenStruct.new(JSON.parse(response.body))
  end

  def starred
    response = HTTParty.get("https://api.github.com/users/#{@username}/starred")
  end

  def followers
    response = HTTParty.get("https://api.github.com/users/#{@username}/followers?per_page=100")
  end

  def following
    response = HTTParty.get("https://api.github.com/users/#{@username}/following")
  end
end
