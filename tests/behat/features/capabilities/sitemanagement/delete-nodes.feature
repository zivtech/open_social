@api @comment @DS-3084
Feature: Delete Nodes
  Benefit: In order to manage my site
  Role: As a SM
  Goal/desire: I want to delete posts and comments on the platform

  @delete-post
  Scenario: Successfully delete comment and post
    Given users:
      | name     | mail               | status | field_profile_first_name | field_profile_last_name |
      | user_1   | mail_1@example.com | 1      | Albert                   | Einstein                |
      | user_2   | mail_2@example.com | 1      | Isaac                    | Newton                  |

        # Scenario: Create post
    Given I am logged in as "user_1"
    And I am on the homepage
    And I fill in "What's on your mind?" with "This is a post by Albert Einstein for Isaac Newton."
    And I press "Post"
    Then I should see the success message "Your post has been posted."

        # Scenario: Delete this post as a sitemanager
    Given I am logged in as an "sitemanager"
    And I am on the homepage
    Then I should see "This is a post by Albert Einstein for Isaac Newton."
    When I click the xth "5" element with the css ".dropdown-toggle"
    And I break
    And I should see the link "Delete"
    Then I click "Delete"
    And I break
    And I click "Delete"
