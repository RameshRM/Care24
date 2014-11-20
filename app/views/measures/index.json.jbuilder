json.array!(@measures) do |measure|
  json.extract! measure, :id, :patient_id, :type, :name, :data
  json.url measure_url(measure, format: :json)
end
