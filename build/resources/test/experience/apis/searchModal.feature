Feature: Search Modal

  Background:
    * url stagingXpeBeUrl
    * def requestBody = read('classpath:experience/requestTemplate/searchModalRequestTemplate.json')

    Scenario:
      Given path '/v2/experience/searchModal'
      And request requestBody
      And header Origin = origin
      And header Content-Type = 'application/json'
      When method POST
      Then status 200
      * print response