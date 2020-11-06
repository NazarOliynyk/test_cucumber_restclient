Feature: BookTest

  Scenario: Verify Saving and Deleting a book
    Given I have to log in and get the token to proceed with books
    When I get the list of existing books and generate the id that does not exist
    And I get the lists of existing authors and genres to get the id of existing author and genre
    Then I should save a new book with non-existing book id and check whether it was saved successfully
    And I should deleted the saved book and check whether it was deleted successfully