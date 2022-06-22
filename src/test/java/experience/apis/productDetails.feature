Feature: Reviews should return successfully

  Background:
    * url stagingXpeBeUrl
    * def requestBody = read('classpath:experience/requestTemplate/productDetailsRequestTemplate.json')
    * def endPoint = 'reviews'

  Scenario: get all reviews
    Given path baseXpePath, endPoint
    And request requestBody
    And header Origin = origin
    And header Content-Type = 'application/json'
    When method POST
    Then status 200
    * print response