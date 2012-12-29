Given /^a single source file called MasterViewController\.m$/ do
  @test_file = @fixtures_input_dir + "FixbracesTestProject/MasterViewController.m"
  FileUtils.mkdir_p @working_dir
  FileUtils.cp @test_file, @working_dir
end

Then /^MasterViewController\.m should be formatted correctly$/ do
  @expected_file = @fixtures_expected_dir + "FixbracesTestProject/MasterViewController.m"
  @result_file = @working_dir + "MasterViewController.m"
  expect(FileUtils.compare_file @result_file, @expected_file).to eq true
end

Given /^an Xcode project$/ do
  #copy the fixtures project to the local directory
  fixtures_dir = "./features/fixtures/FixbracesTestProject/"
  target_dir = "./tmp/aruba/"
  FileUtils.mkdir_p target_dir
  FileUtils.cp_r fixtures_dir + "FixbracesTestProject", target_dir
  FileUtils.cp_r fixtures_dir + "FixbracesTestProject.xcodeproj", target_dir
  FileUtils.cp_r fixtures_dir + "FixbracesTestProjectTests", target_dir
end
