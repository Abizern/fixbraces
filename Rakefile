#!/usr/bin/env rake
require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rake/clean"
require "cucumber"
require "cucumber/rake/task"

RSpec::Core::RakeTask.new(:spec)

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

task :default => [:spec, :features]
