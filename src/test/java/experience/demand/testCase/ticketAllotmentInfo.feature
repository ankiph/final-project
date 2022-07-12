@Ticket
Feature: [POST] - Ticket Allotment Info

  Background:
    * url baseXpeUrl
    * def endPoint = 'ticketAllotmentInfo'
    * def requestBody = read('classpath:experience/demand/requestTemplate/ticketAllotmentInfo.json')
    * def contentType = 'application/json'

  Scenario: Get the list of time slot & preferences of a product or a ticket
    # Allotment info should be returned when call ticketAllotmentInfo with experience ID, experience ticket ID, and date
    # Product name: 'Hendro's Exclusive - Beauty And Spa', Item name: 'Hendro's Beauty And Spa Package With Timeslot- 150 Minutes'
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = contentType
    * set requestBody
      | path                    | value                 |
      | data.experienceId       | config_experienceId       |
      | data.date.month         |  7                    |
      | data.date.day           |  10                   |
      | data.date.year          |  2022                 |
      | data.experienceTicketId | config_ticketId  |

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response