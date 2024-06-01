# scripts/fetch_repos.rb

require 'httparty'
require 'json'
require 'fileutils'

GITHUB_USERNAME = 'andrewhwaller'
OUTPUT_FILE = './src/_data/repos.json'
PER_PAGE = 100 # Maximum allowed per page

def fetch_repos(page = 1)
  response = HTTParty.get(
    "https://api.github.com/search/repositories",
    query: { q: "topic:slides user:#{GITHUB_USERNAME}", per_page: PER_PAGE, page: page }
  )
  JSON.parse(response.body)["items"]
end

def fetch_all_repos
  page = 1
  all_repos = []

  loop do
    repos = fetch_repos(page)
    break if repos.empty?

    all_repos.concat(repos)
    page += 1
  end

  all_repos
end

def save_repos(repos)
  FileUtils.mkdir_p(File.dirname(OUTPUT_FILE))
  File.write(OUTPUT_FILE, JSON.pretty_generate(repos))
end

repos = fetch_all_repos
save_repos(repos)
