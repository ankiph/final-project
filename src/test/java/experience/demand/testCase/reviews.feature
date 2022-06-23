Feature: [POST] - Reviews

  Background:
    * url baseXpeUrl
    * def endPoint = 'reviews'

  Scenario: get all reviews
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/reviews.json')
    * set requestBody
      | path                                 |  value                  |
      | data.experienceId                    |  '8493528293039'        |
      | data.rowsToReturn                    |  5                      |
      | data.skip                            |  0                      |

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response