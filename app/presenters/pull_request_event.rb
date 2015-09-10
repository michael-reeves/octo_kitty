class PullRequestEvent
  attr_reader :id, :actor_nickname, :repo, :url, :title, :updated_at, :action
  def initialize(request)
    @raw_request = request
    @id = request['id']
    @actor_nickname = request['actor']['login']
    @repo = request['repo']['name']
    @url = request['payload']['pull_request']['html_url']
    @title = request['payload']['pull_request']['title']
    @updated_at = request['payload']['pull_request']['updated_at']
    @action = request['payload']['action']
  end
end
