$(document).on 'change', $('#city-selection'), (e) ->
  optionSelected = $(this).find("option:selected")
  $.ajax
    url: "/site/fetch_weather_info/?location_name=#{optionSelected.text()}"
    type: 'GET'
    data: ''
    dataType: 'script'
  return

$(document). on 'change', $('#state-selection'), (e) ->
  input_state = $(this)
  optionSelected = $(this).find("option:selected")
  $.ajax
    dataType: 'script'
    url: "/api/cities/?query=#{$(optionSelected).val()}"
    success: (data) ->
      dropDownhelper.buildDropdown data, $('select[name="city"]'), ''
        
dropDownhelper = buildDropdown: (result, dropdown, emptyMessage) ->
  dropdown.html ''
  dropdown.append '<option value="">' + emptyMessage + '</option>'
  if result != ''
    $.each JSON.parse(result), (k, v) ->
      dropdown.append '<option value="' + v + '">' + v + '</option>'
      return
  return
