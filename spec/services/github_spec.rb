require 'rails_helper'

describe Github, :vcr do

  describe '#events' do
    it 'returns the first 100 events' do
      github = Github.new('michael-reeves')
      events = github.events
      expect(events.length).to eq 100
    end

    it 'the events have data' do
      github = Github.new('michael-reeves')
      events = github.events
      event  = events.first

      expect(event[:id]).to eq '3132750878'
    end
  end

  describe '#pull_requests' do
    it 'have data' do
      github       = Github.new('michael-reeves')
      pull_request = github.pull_requests.first

      expect(pull_request.id).to             eq '3125432462'
      expect(pull_request.actor_nickname).to eq 'michael-reeves'
      expect(pull_request.repo).to           eq 'mrjaimisra/the_pivot'
      expect(pull_request.url).to eq 'https://github.com/mrjaimisra/the_pivot/pull/80'
      expect(pull_request.title).to          eq 'Fix store admin permission'
      expect(pull_request.updated_at.strftime("%Y-%m-%d")).to eq '2015-09-07'
      expect(pull_request.action).to         eq 'opened'
    end
  end

  describe '#pushes' do
    it "have data" do
      github  = Github.new('michael-reeves')
      push = github.pushes.first

      expect(push.id).to             eq '3136695177'
      expect(push.repo).to           eq 'michael-reeves/octo_kitty'
      expect(push.actor_nickname).to eq 'michael-reeves'
      expect(push.size).to           eq 4
      expect(push.commits.count).to  eq 4
    end
  end

  describe '#user' do
    it "has data" do
      github = Github.new('michael-reeves')
      user   = github.user

      expect(user.login).to        eq 'michael-reeves'
      expect(user.html_url).to     eq 'https://github.com/michael-reeves'
      expect(user.public_repos).to eq 33
      expect(user.public_gists).to eq 4
      expect(user.followers).to    eq 13
      expect(user.following).to    eq 2
    end
  end

  describe '#repos' do
    it "have data" do
      github = Github.new('michael-reeves')
      repos  = github.repos
      repo   = repos.first

      expect(repo.id).to          eq 39031779
      expect(repo.name).to        eq 'active-record-sinatra'
      expect(repo.owner).to       eq 'michael-reeves'
      expect(repo.git_url).to     eq 'git://github.com/michael-reeves/active-record-sinatra.git'
      expect(repo.ssh_url).to     eq 'git@github.com:michael-reeves/active-record-sinatra.git'
      expect(repo.description).to be_nil
      expect(repo.open_issues).to eq 0
    end
  end

  describe '#starred_repos' do
    it "have data" do
      github        = Github.new('michael-reeves')
      starred_repos = github.starred_repos
      star_repo     = starred_repos.last

      expect(starred_repos.count).to   eq 2
      expect(star_repo.id).to          eq 30768220
      expect(star_repo.owner).to       eq 'kpearson'
      expect(star_repo.repo_name).to   eq 'kpearson/dotfiles'
      expect(star_repo.description).to eq 'System settings and dotfiles'
      expect(star_repo.html_url).to    eq 'https://github.com/kpearson/dotfiles'
    end
  end
end
