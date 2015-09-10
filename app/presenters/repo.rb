class Repo
  attr_reader :id, :name, :description, :owner, :html_url,
              :git_url, :ssh_url, :open_issues, :updated_at


  def initialize(request)
    @raw_request = request
    @id          = request[:id]
    @name        = request[:name]
    @description = request[:description]
    @owner       = request[:owner][:login]
    @html_url    = request[:html_url]
    @git_url     = request[:git_url]
    @ssh_url     = request[:ssh_url]
    @open_issues = request[:open_issues]
    @updated_at  = request[:updated_at]
  end
end
