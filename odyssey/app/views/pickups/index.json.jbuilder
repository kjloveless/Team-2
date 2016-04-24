json.array!(@pickups) do |pickup|
  json.extract! pickup, :id, :day_id, :donor_name, :donor_address_line1, :donor_address_line2, :donor_city, :donor_zip, :donor_dwelling_type, :donor_location_instructions, :donor_phone, :donor_email, :number_of_items, :item_description, :other_notes, :pickup_time
  json.url pickup_url(pickup, format: :json)
end
