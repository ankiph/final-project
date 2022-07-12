@GeoDestination
Feature: [POST] - destinationPageV2

  Background:
    * url baseXpeUrl
    * def endPoint = 'destinationPageV2'

  Scenario: Destination data should be returned when calling destinationPageV2 with ID
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/destinationPageV2.json')

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response