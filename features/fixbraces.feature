Feature: The script correctly makes changes to files
  In order to correct the formatting of the Objective-C source files
  The developer will need to make sure that these tests pass

  Scenario: Run the app on a single file
    Given a single source file called MasterViewController.m
    When I run `fixbraces MasterViewController.m`
    Then MasterViewController.m should be formatted correctly
    Then the output should contain "MasterViewController.m"
    And the exit status should be 0

  Scenario: Run the app on a directory
    Given an Xcode project
    When I run `fixbraces .`
    Then the files in the directory should be formatted correctly
    And the exit status should be 0

  Scenario: Run the app on a number of files in the directory
    Given an Xcode project
    When I run `fixbraces FixbracesTestProject/AppDelegate.m FixbracesTestProject/DetailViewController.m Fixbraces/MasterViewController.m FixbracesTestProject/main.m`
    Then the .m files in that directory are changed
    And the changed files should be listed
    And there should not be any .h files listed
    And the .h files in that directory are unchanged
    And the exit status should be 0

  Scenario: Show an error message if no file or directory is provided
    Given an Xcode project
    When I run `fixbraces`
    Then the output should contain "Error: fixbraces needs to know what directory or files to attempt to correct."
    And the exit status should not be 0

  Scenario: Show an error message for a non-existent file or directory
    Given an Xcode project
    When I run `fixbraces non_existent_path`
    Then the output should contain "Invalid path"
    And the exit status should be 0

  Scenario: If one of the files is non-existent correct the file that can be changed and show an error message for the non-existent one
    Given a single source file called MasterViewController.m
    When I run `fixbraces MasterViewController.m some_file.m`
    Then MasterViewController.m should be formatted correctly
    And the output should contain "MasterViewController.m"
    And the output should contain "Invalid path"
    And the exit status should be 0
