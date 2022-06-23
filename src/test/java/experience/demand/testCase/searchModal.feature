Feature: [POST] - Search Modal

  Background:
    * url baseXpeUrl
    * def endPoint = 'searchModal'

    Scenario:
      Given path baseXpePath, endPoint
      And header Origin = origin
      And header Content-Type = 'application/json'
      * def requestBody = read('classpath:experience/demand/requestTemplate/searchModal.json')

      * print requestBody
      And request requestBody
      When method POST
      Then status 200
      * print response