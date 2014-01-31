class ReposController < ApplicationController

  def index
    @repos = Repo.all
  end

  def download
    api = 'user/repos'
    github_api_command_string = "\"Authorization: token #{ENV['GITHUB_TOKEN']}\" https://api.github.com/#{api}"
    data = `curl -H #{github_api_command_string}`
    repos = JSON.parse(data)
    repos.each do |repo|
      repo = repo.keep_if { |k,v| k == 'id' || k == 'name' }
      record = Repo.new(repo)
      record.save
    end
    redirect_to repos_index_path
  end

end
