class Repo
  attr_reader :id, :name, :description, :owner, :git_url, :ssh_url, :open_issues

  def initialize(request)
    @raw_request = request
    @id          = request[:id]
    @name        = request[:name]
    @description = request[:description]
    @owner       = request[:owner][:login]
    @git_url     = request[:git_url]
    @ssh_url     = request[:ssh_url]
    @open_issues = request[:open_issues]
  end
end
