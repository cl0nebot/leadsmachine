json.array!(@citations) do |citation|
  json.extract! citation, :id, :citation_source_id, :property_id, :napmatch, :url, :pa
  json.url citation_url(citation, format: :json)
end
