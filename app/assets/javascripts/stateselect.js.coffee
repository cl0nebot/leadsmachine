jQuery ->

  city        = $('#machine_city_id').html()
  specialty   = $('#machine_specialty_id').html()
  subcategory = $('#machine_subcategory_id').html()
  
  $('#machine_province_id').change ->
    province = $('#machine_province_id :selected').text()
    cityoptions = $(city).filter("optgroup[label='#{province}']").html()
    if cityoptions
      $('#machine_city_id').html(cityoptions)
    else
      $('#machine_city_id').empty

  $('#machine_subcategory_id').change ->
  	subcategory = $('#machine_subcategory_id :selected').text()
  	suboptions = $(specialty).filter("optgroup[label='#{subcategory}']").html()
  	if suboptions
  		$('#machine_specialty_id').html(suboptions)
  	else
			$('#machine_specialty_id').empty  

  $('#machine_category_id').change ->
  	category = $('#machine_category_id :selected').text()
  	options = $(subcategory).filter("optgroup[label='#{category}']").html()
  	if options
  		$('#machine_subcategory_id').html(options)
  	else
  		$('#machine_subcategory_id').empty
  
