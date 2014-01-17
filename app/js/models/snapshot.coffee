App.Snapshot = DS.Model.extend
  snapDate: DS.attr('date')
  staffWeights: DS.attr('weights')
  unassignableWeights: DS.attr('weights')
  assignableWeights: DS.attr('weights')
  billingWeights: DS.attr('weights')
  nonBillingWeights: DS.attr('weights')
  utilization: DS.attr('number')
  office_id: DS.attr('string')

  formattedSnapDate:((key, string) ->
    if arguments.length >1
      [y, m, d] = string.split('-')
      @set('snapDate', new Date(y, m - 1, d))
    moment(@get('snapDate')).format("YYYY-MM-DD")
  ).property('snapDate')

  overheadWeights: (->
    @get('staffWeights').filter (person) ->
      person.percentage < 100
  ).property('staffWeights')

  billableWeights: (->
    @get('staffWeights').filter (person) ->
      person.percentage > 0
  ).property('staffWeights')
