@Autocomplete
Feature: [POST] - Location Picker Modal V2

  Background:
    * url baseXpeUrl
    * def endPoint = 'locationPickerModalV2'
    * def requestBody = read('classpath:experience/demand/requestTemplate/locationPickerModalV2.json')
    * def contentType = 'application/json'

  Scenario: Get the destination data on Location Picker Modal
    # Destination data should be returned when call locationPickerModalV2
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = contentType
    And request requestBody
    When method POST
    Then status 200
    * print response