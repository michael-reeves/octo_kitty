class User < ActiveRecord::Base

  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(provider: data.provider, uid: data.uid)

    user.email     = data.info.email
    user.nickname  = data.info.nickname
    user.image_url = data.info.image
    user.token     = data.credentials.token

    user.save
    return user
  end

  def service
    @service ||= Github.new(self.nickname)
  end

  def github_stats
    @github_stats ||= GithubStats.new(self.nickname)
  end

  def info
    @info ||= service.user
  end

  def orgs
    @orgs ||= service.orgs
  end

  def repos
    @repos ||= service.repos
  end

  def starred_repos
    @starred_repos ||= service.starred_repos
  end

  def pushes
    @pushes ||= service.pushes
  end

  def pull_requests
    @pull_requests ||= service.pull_requests
  end

  def yearly_commit_activity
    @yearly_commit_activity ||= github_stats.scores.reduce(:+)
  end

  def current_streak
    @current_streak ||= github_stats.streak
  end

  def longest_streak
    @longest_streak ||= github_stats.longest_streak
  end

end
