Feature: [POST] - Product Chain Page

  Background:
    * url baseXpeUrl
    * def endPoint = 'productChainPage'
    * def requestBody = read('classpath:experience/demand/requestTemplate/productChainPage.json')
    * def contentType = 'application/json'

    Scenario: Get the chain data from chain ID
      # Chain data should be returned when call productChainPage with chain ID
      # Chain name: 'Hendro's Exclusive'
      Given path baseXpePath, endPoint
      And header Origin = origin
      And header Content-Type = contentType
      * set requestBody
      | path          | value     |
      | data.chainId  | config_chainId |
      * print requestBody
      And request requestBody
      When method POST
      Then status 200
      * print response