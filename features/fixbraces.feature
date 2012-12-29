Feature: The binary interface for fixbraces works
  In order to be sure that the cli version of the gem works
  The developer will need to make sure that these tests pass

  Scenario: options
    Given a single source file called MasterViewController.m
    When I run `fixbraces MasterViewController.m`
    Then MasterViewController.m should be formatted correctly
    And the exit status should be 0
