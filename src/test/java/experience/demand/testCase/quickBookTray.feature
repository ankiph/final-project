@SearchResult
Feature: [POST] - Quick Book Tray

  Background:
    * url baseXpeUrl
    * def endPoint = 'quickBookTray'
    * def requestBody = read('classpath:experience/demand/requestTemplate/quickBookTray.json')
    * def contentType = 'application/json'

  Scenario: Get quick book tray data on Search Result page
    # Quick book tray data should be returned when call quickBookTray with experience ID
    # Product name: 'Hendro's Exclusive - Beauty And Spa'
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = contentType
    * set requestBody
      | path               | value           |
      | data.experienceId  | '9654844083283' |
    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response


