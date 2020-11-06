Feature: AuthorTest

  Scenario: Verify Saving and Deleting an author
    Given I have to log in and get the token to proceed with authors
    When I get the list of existing authors and generate the id that does not exist
    Then I should save a new author with non-existing id and check whether it was saved successfully
    And I should deleted the saved author and check whether it was deleted successfully
   