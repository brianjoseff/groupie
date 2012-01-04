jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  customer.setupForm()

customer =
  setupForm: ->
    $('#new_customer').submit ->
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        customer.processCard()
        false
      else
        true
  
  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, customer.handleStripeResponse)
  
  handleStripeResponse: (status, response) ->
    if status == 200
      $('#customer_stripe_card_token').val(response.id)
      $('#new_customer')[0].submit()
    else
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)

