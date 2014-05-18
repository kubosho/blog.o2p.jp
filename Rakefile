MASTER_REPO = if ENV['GH_TOKEN']
                      'https://$GH_TOKEN@github.com/o2project/o2project.github.io'
                    else
                      'git@github.com:o2project/o2project.github.io'
                    end
PUBLISH_BRANCH = 'master'
DEST_DIR = 'build'

def init_repo(repo, branch)
  require 'fileutils'

  if Dir["#{DEST_DIR}/.git"].empty?
    FileUtils.rm_rf DEST_DIR
    sh "git clone --quiet #{repo} #{DEST_DIR} 2> /dev/null"
  end

  Dir.chdir DEST_DIR do
    sh "git checkout --orphan #{branch}"
  end
end

def update_repo(branch)
  Dir.chdir DEST_DIR do
    sh 'git fetch origin'
    sh "git reset --hard origin/#{branch}"
  end
end

def build
  sh 'bundle exec middleman build'
end

def clean
  require 'fileutils'

  Dir["#{DEST_DIR}/*"].each do |file|
    FileUtils.rm_rf file
  end
end

def push_to_target_repo(repo, branch)
  sha1, _ = `git log -n 1 --oneline`.strip.split(' ')

  Dir.chdir DEST_DIR do
    sh 'git add -A'
    sh "git commit -m '[ci skip] Update with #{sha1}'"
    sh "git push --quiet #{repo} #{branch} 2> /dev/null"
  end
end

desc 'Setup origin repo for GitHub pages'
task :setup do
  initialize_repo MASTER_REPO, PUBLISH_BRANCH
  update_repo PUBLISH_BRANCH
end

desc 'Clean built files'
task :clean do
  clean
end

desc 'Build sites'
task :build do
  clean
  build
end

desc 'Publish website'
task :publish do
  push_to_target_repo MASTER_REPO, PUBLISH_BRANCH
end

task default: :setup
