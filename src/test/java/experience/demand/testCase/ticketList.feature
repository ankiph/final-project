Feature: [POST] - Ticket List

  Background:
    * url baseXpeUrl
    * def endPoint = 'ticketList'
    * def requestBody = read('classpath:experience/demand/requestTemplate/ticketList.json')
    * def contentType = 'application/json'

  Scenario: Get the list of available ticket from experience ID
    # Ticket data should be returned when call ticketList with experience ID
    # Product name: 'Hendro's Exclusive - Beauty And Spa'
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = contentType
    * set requestBody
      | path                    | value                  |
      | data.experienceId       | '9654844083283'        |
    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response