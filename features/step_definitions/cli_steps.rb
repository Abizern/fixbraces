Then /^version information should be displayed$/ do
  step %(the output should match /v\\d+\\.\\d+\\.\\d+/)
end

Then /^usage information should be displayed$/ do
  step %(the output should contain "Usage:")
end
