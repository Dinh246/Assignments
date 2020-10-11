Feature: Tiki Now
    In order to buy things in Tiki
    As a customer
    I want to add products to cart and verify the total cost
    
    Background:
        Given launch browser and go to tiki homepage

    Scenario: Add to cart
        When I search 'apple', select Tiki Now, choose the fifth product, add 2 products to cart and go to checkout
        Then I should see the quantity and the total cost in cart