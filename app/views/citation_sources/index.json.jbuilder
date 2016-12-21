json.array!(@citation_sources) do |citation_source|
  json.extract! citation_source, :id, :site, :submissionurl, :da, :freesubmit
  json.url citation_source_url(citation_source, format: :json)
end
