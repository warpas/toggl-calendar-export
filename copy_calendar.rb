require_relative "google/calendar"

calendar_object = Google::Calendar.new(config_file: "dw_credentials", token_file: "dwc_token", calendar_name: "exercise")
list = calendar_object.list_calendars.select do |calendar|
  calendar[:name].start_with?("Exercise -")
end

list.each do |calendar|
  fetched = calendar_object.fetch_all_events(calendar[:id])
  fetched.items.each do |event|
    calendar_object.insert_calendar_event(event)
  end
end