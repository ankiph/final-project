Feature: Search Result Page

  Background:
    * url baseXpeUrl
    * def endPoint = 'searchV2'

  Scenario: Get all search results (empty keyword)
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/requestTemplate/searchResultRequestTemplate.json')
    
    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response
#    And match response.data.results[0].experienceName == 'SnowBay Waterpark Tickets - Easy Access EA'
#    And print response.data.results[0].experienceName

  Scenario: Get all search results (with search Query)
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/requestTemplate/searchResultRequestTemplate.json')
    * set requestBody
      | path                                 |  value                  |
      | data.currency                        |  'IDR'                  |
      | data.sortType                        |  'MOST_POPULAR'         |
      | data.filters.filterSelected          |  false                  |
      | data.filters.typeFilter              |  null                   |
      | data.filters.priceFilter.minPrice    |  null                   |
      | data.filters.priceFilter.maxPrice    |  null                   |
      | data.filters.instantVoucherOnly      |  false                  |
      | data.filters.subTypeFilter           |  []                     |
      | data.filters.durationFilter          |  []                     |
      | data.basicSearchSpec.searchQuery     |  'hendro'               |
      | data.basicSearchSpec.searchType      |  'ALL_PRODUCTS'         |
      | data.basicSearchSpec.entityId        |  null                   |
      | data.rowsToReturn                    |  50                     |
      | data.skip                            |  0                      |

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
     * print response