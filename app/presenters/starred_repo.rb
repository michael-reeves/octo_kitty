class StarredRepo
  attr_reader :id, :repo_name, :description, :owner, :html_url

  def initialize(star_repo)
    @raw_request = star_repo
    @id          = star_repo[:id]
    @repo_name   = star_repo[:full_name]
    @description = star_repo[:description]
    @owner       = star_repo[:owner][:login]
    @html_url    = star_repo[:html_url]
  end
end
