class Org
  attr_reader :id, :name, :description, :url, :avatar

  def initialize(org)
    @raw_org     = org
    @id          = org[:id]
    @name        = org[:login]
    @description = org[:description]
    @url         = org[:url]
    @avatar      = org[:avatar_url]
  end
end
