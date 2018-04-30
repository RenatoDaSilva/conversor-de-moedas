$(document).ready ->
  $('#swap_button').click ->
    value_from = $('#quantity').val()
    value_to = $('#result').val()
    $('#quantity').val(value_to)
    $('#result').val(value_from)

    tag_currency_from = $('#currency :selected').val()
    tag_currency_to = $('#currency_destination :selected').val()
    $("#currency").val(tag_currency_to).change("#currency")
    $("#currency_destination").val(tag_currency_from).change("#currency_destination")

  $('#currency').change ->
    ('#exchange_form').submit()

  $('#currency_destination').change ->
    ('#exchange_form').submit()

  $('#quantity').keyup ->
    ('#exchange_form').submit()

  $('#exchange_form').submit ->
    if $('form').attr('action') == '/exchange'
      $.ajax '/exchange',
        type: 'POST'
        dataType: 'json'
        data: {
          currency: $("#currency").val(),
          currency_destination: $("#currency_destination").val(),
          quantity: $("#quantity").val()
        }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
          $('#result').val(data.value)
      return false;
