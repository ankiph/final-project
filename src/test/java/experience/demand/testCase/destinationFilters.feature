@Destination
Feature: [POST] - destinationFilters

  Background:
    * url baseXpeUrl
    * def endPoint = 'destinationFilters'

  Scenario: User current location should be returned when calling destinationFilters (user location turned on)
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/destinationFilters.json')

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response