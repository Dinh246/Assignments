Feature: Count Products
    In order to get statistics
    As a customer
    I want to get the total result of the products I search for

    Background: Launch browser
        Given Open browser and go to tiki homepage

    Scenario: Count
        When I search anything such as: ''
        Then I want to know how many products will be displayed in the first page

