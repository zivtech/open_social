@api @comment @post @stability @DS-3084
Feature: Delete Nodes
  Benefit: In order to manage my site
  Role: As a SM
  Goal/desire: I want to delete posts and comments on the platform

  Scenario: Successfully delete comment and post
    Given users:
      | name      | status | pass |
      | PostUser1 |      1 | PostUser1 |
      | PostUser2 |      1 | PostUser2 |
    And I am logged in as "PostUser1"
    And I am on the homepage

        # Scenario: Create a post
    When I fill in "What's on your mind?" with "This is a post."
    And I press "Post"
    Then I should see the success message "Your post has been posted."
    And I should see "This is a post." in the "Main content front"
    And I should see "PostUser1" in the "Main content front"
    And I should be on "/stream"

        # Scenario: Post a comment on the created post
    Given I am logged in as "PostUser2"
    And I am on the homepage
    When I fill in "Comment #1" for "Post comment"
    And I press "Comment"
    Then I should see the success message "Your comment has been posted."

        # Scenario: Delete this comment on the post
    Given I am logged in as an "sitemanager"
    And I am on the profile of "PostUser1"
    Then I should see "Comment #1"
    When I click the xth "6" element with the css ".dropdown-toggle"
    And I break
    And I should see the link "Delete"
    Then I click "Delete"
    And I should see "Any replies to this comment will be lost."
    And I click "Delete"
