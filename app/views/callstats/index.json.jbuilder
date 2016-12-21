json.array!(@callstats) do |callstat|
  json.extract! callstat, :id, :machine_id, :calls
  json.url callstat_url(callstat, format: :json)
end
