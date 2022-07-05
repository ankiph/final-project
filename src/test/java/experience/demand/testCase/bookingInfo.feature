Feature: [POST] - bookingInfo

  Background:
    * url baseXpeUrl
    * def endPoint = 'bookingInfo'

  Scenario: Get booking info in payment page
    * def createBooking = call read('../../common/createBooking.feature')
    * def newAuth =  createBooking.response.data.auth
    * def newBookingId =  createBooking.response.data.bookingId
    * def newInvoiceId =  createBooking.response.data.invoiceId

    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/bookingInfo.json')
    * set requestBody
      | path                                 |  value                   |
      | data.auth                            |  newAuth                 |
      | data.bookingId                       |  newBookingId            |
      | data.invoiceId                       |  newInvoiceId            |


    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response

  @e2e @ignore
  Scenario:
#    * def createBooking = call read('../../common/createBooking.feature')
#    * def newAuth =  createBooking.response.data.auth
#    * def newBookingId =  createBooking.response.data.bookingId
#    * def newInvoiceId =  createBooking.response.data.invoiceId

    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/bookingInfo.json')
    * set requestBody
      | path                                 |  value                   |
      | data.auth                            |  newAuth                 |
      | data.bookingId                       |  newBookingId            |
      | data.invoiceId                       |  newInvoiceId            |


    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response