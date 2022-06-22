Feature: Search Result Page

  Background:
    * url stagingXpeBeUrl
    * def requestBody = read('classpath:experience/requestTemplate/searchResultRequestTemplate.json')
  #  * def contentType =

  Scenario: Search Result Page
    Given path '/v2/experience/searchV2'
    And request requestBody
    And header Origin = origin
  #  And header Referer = 'https://m-rc.web.tvlk.dev/en-id/activities/search?st=ALL_PRODUCTS&q=hendro%20beauty%20and%20spa&sort=RELEVANCE'
    And header Content-Type = 'application/json'
#    And header x-domain = 'experience'
#    And header x-route-prefix = 'en-id'
#    And header cookie = 'G_ENABLED_IDPS=google; _gcl_au=1.1.279495108.1649395093; _fbp=fb.1.1649395092692.305549086; state-auth=auth-811e6079-967a-4d75-93bb-c2b913aabbf3; amp_61b9ab_tvlk.dev=IjscpGeDaJrK-VrYlP8_yp...1g03vt82q.1g03vt82s.18.0.18; _clck=1r9a296|1|f0j|0; _uetvid=0aecd460b97611ec9f280fc793afd475; g_state={"i_l":4,"i_p":1657016089392}; _gid=GA1.2.1202387250.1655692894; tv-repeat-visit=true; AWSALB=4RvIqKlwljoDLqLnCMnPfC4fkz+lN7O0CBOM7TKc+VnJiGJHSVgDpGfj1dwUkOsrXqWQ+Dd2LddqhlcUPuENcUwlX+rPgqWVQ5qBP/in67Rnc1zGYwXv47ZF8BcE; AWSALBCORS=4RvIqKlwljoDLqLnCMnPfC4fkz+lN7O0CBOM7TKc+VnJiGJHSVgDpGfj1dwUkOsrXqWQ+Dd2LddqhlcUPuENcUwlX+rPgqWVQ5qBP/in67Rnc1zGYwXv47ZF8BcE; tvl=qgdHX7GvehrD9XH5a3S4PdE8AYpuF3hYPaT5bxhY7ZaSToRgHxpjIVItq91bQsbVRTDT6MLNjMGdxceKBQ34axRORuePm2+noKUIKFwab6NsFpN9RHYl8MAkBipHi/eBp/Lx6VLkWMQwVBuMYBpEe+Kp+PKiyI7/AvDM4I/6ri4WNs/dbXjPWMIzWs8UlHaod+kJN485+w6qzaeilV2oWiNZMUARyhV60G9eYi4HtBzlMRaqzLkZbQpj+0TnixmYJ//0LuDhWKbS0HDoTtmSgA==; experience_redirect=0; _gat_UA-29776811-13=1; tvs=qgdHX7GvehrD9XH5a3S4PXWKx93/3Xi103f/kPpnhg1IQez7AjqOPow88qqCMiL7CqvJjpn5Z2svD8QZzAmUN8I7bk86ki9gpnRvB7n1SMj4qEi7O+bgPtOsr/t2tkhK6uGU8xnhPcVPWo/ia5JQxFhwVSONfQ7MHkWkFOmDvqRkavLdHuL5giNG8aqotFC9VO4rB0pWtbCtmLVQm6Ftw4G6YV68HZIC986bmx7ZCKMPCsEHlGXiaiwjywNxTVEyOGV4z4rf6xuJSIrscWN5xR688G5WgNGO/YeOwvw1+vzNoYBX7CLG6jLll4+uYhFtNkfkfKnxNGqVSM1GiyD8phx1YgxnOeSEm0ZkEDZsZ3P/ex9Qtugvmn2FQqDyTdDkpRqqNcuq00KMpaxEnmmHBA==; _ga=GA1.2.548233310.1649394996; cto_bundle=KIN1-F8xVEdQMlM4c1VSQXVoTSUyQmx4MVJnMmw0aWVQZDVzMENnUnV3Rk9yZXczVSUyQnhqaTlMOFclMkZBdnpyQWxxUXRFVWF5cVNwZE5SYjcwJTJGMmlLTXBUQ3FQT3NjZUEySVU5ZTVBN1hyVFM4RFZpJTJGMG1OTFRNNWJOVFh2TEFDb00lMkZOUXYxWnJzeTRrcVBYNUZtdXNkUnVUZnpaeHkyNXY1QmtXWEtVUjh2bXhRN2thT1ZQRjlZVDlVRGtheFJhVGVoamMwMzc; amp_61b9ab=lCBv68XRWu1oyP1MhSXEs7.MjMyMDUzODk=..1g62ec1vg.1g62hj58a.bli.0.bli; _ga_9PDTTXB25L=GS1.1.1655792076.124.1.1655795462.11; experienceVisit={"visitId":"5785eec7-3016-4dcd-ad61-b4d5a817e1bf","eventSeq":427,"eventKey":"5785eec7-3016-4dcd-ad61-b4d5a817e1bf.427"}'
    When method POST
    Then status 200
     * print response
    And match response.data.results[0].experienceName == 'SnowBay Waterpark Tickets - Easy Access EA'
    And print response.data.results[0].experienceName