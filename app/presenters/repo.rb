class Repo
  attr_reader :id, :name, :description, :owner, :html_url,
              :git_url, :ssh_url, :open_issues, :updated_at


  def initialize(repo)
    @raw_request = repo
    @id          = repo[:id]
    @name        = repo[:name]
    @description = repo[:description]
    @owner       = repo[:owner][:login]
    @html_url    = repo[:html_url]
    @git_url     = repo[:git_url]
    @ssh_url     = repo[:ssh_url]
    @open_issues = repo[:open_issues]
    @updated_at  = Time.parse(repo[:updated_at])
  end
end
