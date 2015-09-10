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
      event = events.first
      expect(event.id).to eq '3132750878'
    end
  end

  describe '#pull_requests' do
    it 'have data' do
      github = Github.new('michael-reeves')
      pull_request = github.pull_requests.first
      expect(pull_request.id).to eq '3125432462'
      expect(pull_request.actor_nickname).to eq 'michael-reeves'
      expect(pull_request.repo).to eq 'mrjaimisra/the_pivot'
      expect(pull_request.url).to eq 'https://github.com/mrjaimisra/the_pivot/pull/80'
      expect(pull_request.title).to eq 'Fix store admin permission'
      expect(pull_request.updated_at).to eq '2015-09-07T22:58:24Z'
      expect(pull_request.action).to eq 'opened'
    end
  end
end
