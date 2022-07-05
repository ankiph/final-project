Feature: [POST] - Minimum Price

  Background:
    * url baseXpeUrl
    * def endPoint = 'minimumPrice'
    * def requestBody = read('classpath:experience/demand/requestTemplate/minimumPrice.json')
    * def contentType = 'application/json'

  Scenario: Get minimum price when user open calendar in ticket list and pax selection page
    # Minimum price should be returned when call minimumPrice with experience ID, experience ticket ID, and date
    # Product name: 'Hendro's Exclusive - Beauty And Spa', Item name: 'Hendro's Beauty And Spa Package With Timeslot- 150 Minutes'
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = contentType
    * set requestBody
      | path                    | value                 |
      | data.experienceId       | config_experienceId   |
      | data.date.month         |  7                    |
      | data.date.day           |  10                   |
      | data.date.year          |  2022                 |
      | data.experienceTicketId | config_ticketId       |

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response