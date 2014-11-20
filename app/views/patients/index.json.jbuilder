json.array!(@patients) do |patient|
  json.extract! patient, :id, :email, :last_name, :first_name
  json.url patient_url(patient, format: :json)
end
