Feature: GenreTest

  Scenario: Verify Saving and Deleting a genre
    Given I have to log in and get the token to proceed with genres
    When I get the list of existing genres and generate the id that does not exist
    Then I should save a new genre with non-existing id and check whether it was saved successfully
    And I should deleted the saved genre and check whether it was deleted successfully