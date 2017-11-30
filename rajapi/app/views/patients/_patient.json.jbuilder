json.extract! patient, :id, :name, :phonenumber, :address, :age, :height, :weight, :aadharnumber, :created_at, :updated_at
json.url patient_url(patient, format: :json)
