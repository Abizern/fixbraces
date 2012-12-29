require "aruba/cucumber"

ENV['PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"
LIB_DIR = File.join(File.expand_path(File.dirname(__FILE__)),'..','..','lib')

Before do
  @original_rubylib = ENV['RUBYLIB']
  ENV['RUBYLIB'] = LIB_DIR + File::PATH_SEPARATOR + ENV['RUBYLIB'].to_s
  @fixtures_input_dir = Dir.pwd + "/features/fixtures/FixbracesTestProject/"
  @fixtures_expected_dir = Dir.pwd + "/features/fixtures/FixbracesTestProjectExpected/"
  @working_dir = Dir.pwd + "/tmp/aruba/"
end

After do
  ENV['RUBYLIB'] = @original_rubylib
end
