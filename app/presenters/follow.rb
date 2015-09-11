class Follow
  attr_reader :id, :nickname, :avatar, :html_url

  def initialize(follow)
    @raw_follow = follow
    @id         = follow[:id]
    @nickname   = follow[:login]
    @avatar     = follow[:avatar_url]
    @html_url   = follow[:html_url]
  end
end
