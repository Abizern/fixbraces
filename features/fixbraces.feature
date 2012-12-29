Feature: The binary interface for fixbraces works
  In order to be sure that the cli version of the gem works
  The developer will need to make sure that these tests pass

  Scenario: Run the app on a single file
    Given a single source file called MasterViewController.m
    When I run `fixbraces MasterViewController.m`
    Then MasterViewController.m should be formatted correctly
    And the exit status should be 0

  Scenario: Run the app on a directory
    Given an Xcode project
    When I run `"fixbraces ."`
    Then the files in the directory should be formatted correctly
    And the exit status should be 0

  Scenario: Run the app on a number of files in the directory
    Given an Xcode project
    When I run `"fixbraces FixbracesTestProject/*.m"`
    Then the .m files in that directory are changed
    And the .h files in that directory are unchanged
    And the exit status should be 0
