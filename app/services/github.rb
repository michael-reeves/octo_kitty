class Github
  def initialize(username)
    @username = username
  end

  def events
    @events ||= begin
      response = HTTParty.get("https://api.github.com/users/#{@username}/events?per_page=100")

      JSON.parse(response.body, symbolize_names: true)
    end
  end

  def pull_requests
    pull_requests = events.find_all do |event|
      event[:type] == 'PullRequestEvent'
    end

    pull_requests.map { |request| PullRequestEvent.new(request) }
  end

  def pushes
    pushes = events.find_all do |event|
      event[:type] == 'PushEvent'
    end

    pushes.map { |push| PushEvent.new(push) }
  end

  def repos
    response = HTTParty.get("https://api.github.com/users/#{@username}/repos?per_page=100")

    JSON.parse(response.body, symbolize_names: true).map do |request|
      Repo.new(request)
    end
  end

  def user
    response = HTTParty.get("https://api.github.com/users/#{@username}")

    OpenStruct.new(JSON.parse(response.body))
  end

  def starred_repos
    response = HTTParty.get("https://api.github.com/users/#{@username}/starred")
    
    JSON.parse(response.body, symbolize_names: true).map do |star_repo|
      StarredRepo.new(star_repo)
    end
  end

  def followers
    response = HTTParty.get("https://api.github.com/users/#{@username}/followers?per_page=100")
  end

  def following
    response = HTTParty.get("https://api.github.com/users/#{@username}/following")
  end
end
