Feature: [POST] - Category Page

  Background:
    * url baseXpeUrl
    * def endPoint = 'categoryPage'
    * def requestBody = read('classpath:experience/demand/requestTemplate/categoryPage.json')
    * def contentType = 'application/json'

  Scenario: Get data of Category Page
    # Category page data should be returned when call categoryPage with type
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = contentType
    * set requestBody
      | path                                 |  value                      |
      | data.type                            |  'BEAUTY_AND_SPA'           |

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response

