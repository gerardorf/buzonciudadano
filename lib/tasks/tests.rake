require 'rubygems'
require 'rspec/core/rake_task'


namespace :test do

    desc "Run routes tests"
    RSpec::Core::RakeTask.new(:routes) do |t|
        t.pattern = "*/test/routes/*.rb"
        t.rspec_opts = " -c"
    end

    desc "Run unit tests"
    RSpec::Core::RakeTask.new(:unit) do |t|
      t.pattern = FileList['test/unit/*.rb']
        t.rspec_opts = " -c"
    end

    desc "Run unit tests"
    RSpec::Core::RakeTask.new(:integration) do |t|
      t.pattern = FileList['test/integration/*.rb']
        t.rspec_opts = " -c"
    end

end

