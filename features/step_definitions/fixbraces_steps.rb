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

Then /^MasterViewController\.m should not be formatted correctly$/ do
  @expected_file = @fixtures_input_dir + "FixbracesTestProject/MasterViewController.m"
  @result_file = @working_dir + "MasterViewController.m"
  expect(FileUtils.compare_file @result_file, @expected_file).to eq true
end

Given /^an Xcode project$/ do
  FileUtils.mkdir_p @working_dir
  FileUtils.cp_r @fixtures_input_dir + "FixbracesTestProject", @working_dir
  FileUtils.cp_r @fixtures_input_dir + "FixbracesTestProject.xcodeproj", @working_dir
  FileUtils.cp_r @fixtures_input_dir + "FixbracesTestProjectTests", @working_dir
end

Then /^the files in the directory should be formatted correctly$/ do
  result = `diff -r --brief --exclude=.DS_Store #{@working_dir} #{@fixtures_expected_dir}`
  expect(result).to eq ""
end

Then /^the files in the directory should be unchanged$/ do
  result = `diff -r --brief --exclude=.DS_Store #{@working_dir} #{@fixtures_input_dir}`
  expect(result).to eq ""
end

Then /^the \.m files in that directory are changed$/ do
  # Under testing we have complete control over the files. so use a hard coded list.
  base_dir = File.join @working_dir, "FixbracesTestProject"
  base_expected_dir = File.join @fixtures_expected_dir, "FixbracesTestProject"
  files = ["AppDelegate.m", "DetailViewController.m", "MasterViewController.m", "main.m"]

  result = ""
  files.each do |f|
    input = File.join base_dir, f
    expected = File.join base_expected_dir, f
    result += `diff --brief -r #{input} #{expected}`
  end

  expect(result).not_to eq ""
end

Then /^the changed files should be listed$/ do
  step %(the output should contain "AppDelegate.m")
  step %(the output should contain "DetailViewController.m")
  step %(the output should contain "MasterViewController.m")
  step %(the output should contain "main.m")
end

When /^the suggested changed files should be listed$/ do
  step %(the changed files should be listed)
end

Then /^there should not be any .h files listed$/ do
  step %(the output should not contain "AppDelegate.h")
end

Then /^the \.h files in that directory are unchanged$/ do
  base_dir = File.join @working_dir, "FixbracesTestProject"
  # We're looking fore unchanged files, so comparing them against the input not expected
  base_expected_dir = File.join @fixtures_input_dir, "FixbracesTestProject"
  files = ["AppDelegate.h", "DetailViewController.h", "MasterViewController.h"]

  result = ""
  files.each do |f|
    input = File.join base_dir, f
    expected = File.join base_expected_dir, f
    result += `diff --brief #{input} #{expected}`
  end

  expect(result).to eq ""
end
