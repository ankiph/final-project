Feature: [POST] - searchV2

  Background:
    * url baseXpeUrl
    * def endPoint = 'searchV2'

  Scenario: Product results should be returned when call searchV2 with empty keyword
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/searchV2.json')
    
    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response

  Scenario: Product results should be returned when call searchV2 with search query and filters
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/searchV2.json')
    * set requestBody
      | path                                 |  value                  |
      | data.currency                        |  'IDR'                  |
      | data.sortType                        |  'DISTANCE'             |
      | data.filters.availabilityFilter      |  []                     |
      | data.filters.durationFilter          |  []                     |
      | data.filters.featureFilter           |  ["CLEAN_EXPERIENCE"]   |
      | data.filters.geoIdsFilter            |  []                     |
      | data.filters.priceFilter.minPrice    |  null                   |
      | data.filters.priceFilter.maxPrice    |  200000                 |
      | data.filters.instantVoucherOnly      |  false                  |
      | data.filters.subTypeFilter           |  []                     |
      | data.filters.promoFilterList         |  []                     |
      | data.filters.typeFilterList          |  ["ATTRACTION"]         |
      | data.basicSearchSpec.searchQuery     |  'hendro'               |
      | data.basicSearchSpec.searchType      |  'ALL_PRODUCTS'         |
      | data.basicSearchSpec.entityId        |  null                   |
      | data.basicSearchSpec.geoLocation.lat |  -6.17511               |
      | data.basicSearchSpec.geoLocation.lon |  106.865036             |
      | data.rowsToReturn                    |  50                     |
      | data.skip                            |  0                      |

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
     * print response

  @chain @ignore @e2e
  Scenario: get Product results in chain page
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/chainSearchV2.json')
    * set requestBody
      | path                                 |  value                  |
      | data.basicSearchSpec.searchType      |  'PRODUCT_CHAIN'        |
      | data.basicSearchSpec.entityId        |  config_chainEntityId   |

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response