$ ->
  $('.input.movies select').change ->
    url = "/cus_departments?customer_id=" + $(this).val() # get the selected value from the drop-down
    $('.input.characters select').load(url) # load the response from the url into the specified element(s)
$ ->
  $('.input.vend select').change ->
    url = "/ven_items?vendor_id=" + $(this).val() # get the selected value from the drop-down
    $('.input.venit select').load(url) # load the response from the url into the specified element(s)