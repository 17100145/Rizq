json.array!(@rizqs) do |rizq|
  json.extract! rizq, :id, :action, :food, :quantity, :address, :area, :date, :time, :perishable
  json.url rizq_url(rizq, format: :json)
end
