Feature: Help screens
  In order to be easily used
  The user will need useful help screens

  Scenario: Version display
    When I run `fixbraces -v`
    Then version information should be displayed
    And the exit status should be 0

  Scenario: Help display
    When I run `fixbraces -h`
    Then usage information should be displayed
    And the exit status should be 0
