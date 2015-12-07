Feature: Pets
  @selenium
  Scenario: Create a new pet successfully
    Given I have created a customer
    And I request the new pet form
    And I fill the name with "Tien su may"
    And I fill the breed with "Doberman"
    And I fill the age with "5"
    And I fill the weight with "24.5"
    And I fill the last visit with "2013/01/01"
    And I click on the button "Save"
    Then I should see "A pet with name Tien su may and id 1 created."

  Scenario: Create a new pet failed due to missing attributes
    Given I have created a customer
    And I request the new pet form
    And I fill the breed with "Doberman"
    And I fill the weight with "24.5"
    And I fill the last visit with "2013/01/01"
    And I click on the button "Save"
    Then I should see "The following required attributes are missing: name,age."