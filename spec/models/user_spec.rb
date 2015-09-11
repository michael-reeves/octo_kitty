require 'rails_helper'

RSpec.describe User, :vcr, type: :model do
  before do
    @my_user = user
  end

  describe '#github_stats' do
    it "returns data" do
      expect(@my_user.nickname).to eq 'michael-reeves'

      expect(@my_user.github_stats.today).to eq 2
    end
  end

  describe '#yearly_commit_activity' do
    it "returns total commits in the past year" do
      expect(@my_user.yearly_commit_activity).to eq 698
    end
  end

  describe '#current_streak' do
    it "returns the longest streak of days with commits" do
      expect(@my_user.current_streak.count).to eq 6
    end
  end

  describe '#longest_streak' do
    it "returns the longest streak of days with commits" do
      expect(@my_user.longest_streak.count).to eq 17
    end
  end

  describe '#service' do
    it 'is a Github service object' do
      expect(@my_user.service).to be_a Github
    end
  end

  describe '#info' do
    it "has user data" do
      expect(@my_user.info.login).to        eq 'michael-reeves'
      expect(@my_user.info.html_url).to     eq 'https://github.com/michael-reeves'
      expect(@my_user.info.public_repos).to eq 33
    end
  end

  describe '#orgs' do
    it 'has data' do
      expect(@my_user.orgs.count).to eq 0
    end
  end

  describe '#repos' do
    it 'has repo data' do
      repos = @my_user.repos
      repo  = repos.first

      expect(repos.count).to eq 33
      expect(repo.name).to eq 'active-record-sinatra'
      expect(repo.owner).to eq 'michael-reeves'
    end
  end

  describe '#pushes' do
    it 'has data' do
      push = @my_user.pushes.first

      expect(push.actor_nickname).to eq 'michael-reeves'
      expect(push.size).to           eq 3
      expect(push.repo).to           eq 'michael-reeves/octo_kitty'
      expect(push.repo_url).to       eq 'https://api.github.com/repos/michael-reeves/octo_kitty'
    end
  end

  describe '#starred_repos' do
    it 'has data' do
      star_repo = @my_user.starred_repos.first
      expect(@my_user.starred_repos.count).to eq 2
      expect(star_repo.id).to                 eq 41321965
      expect(star_repo.repo_name).to          eq 'mrjaimisra/the_pivot'
      expect(star_repo.owner).to              eq 'mrjaimisra'
    end
  end

end
