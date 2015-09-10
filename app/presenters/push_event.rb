class PushEvent
  attr_reader :id, :actor_nickname, :repo, :repo_url,
              :commits, :size, :created_at

  def initialize(push)
    @raw_push       = push
    @id             = push[:id]
    @actor_nickname = push[:actor][:login]
    @repo           = push[:repo][:name]
    @repo_url       = push[:repo][:url]
    @commits        = push[:payload][:commits]
    @size           = push[:payload][:size]
    @create_at      = Time.parse(push[:created_at])
  end
end
