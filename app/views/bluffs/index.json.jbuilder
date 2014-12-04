json.array!(@bluffs) do |bluff|
  json.extract! bluff, :id
  json.url bluff_url(bluff, format: :json)
end
