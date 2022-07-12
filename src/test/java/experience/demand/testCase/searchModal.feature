@Autocomplete
Feature: [POST] - Search Modal

  Background:
    * url baseXpeUrl
    * def endPoint = 'searchModal'
    * def requestBody = read('classpath:experience/demand/requestTemplate/searchModal.json')
    * def contentType = 'application/json'

    Scenario: Get data on Search Modal
      # Search modal data should be returned when call searchModal
      Given path baseXpePath, endPoint
      And header Origin = origin
      And header Content-Type = contentType
      * print requestBody
      And request requestBody
      When method POST
      Then status 200
      * print response