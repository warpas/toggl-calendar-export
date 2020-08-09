require_relative "../libs/command_line"
require_relative "../libs/google/calendar"
require_relative "../libs/google/sheets"
require "json"

def copy_events(date:, source_cal:, destination_cal:, color_coding:)
  source_calendar = Google::Calendar.new(
    config_file: "libs/google/calendar/ds_credentials.secret.json",
    token_file: "libs/google/calendar/dsc_token.secret.yaml",
    calendar_name: source_cal
  )
  destination_calendar = Google::Calendar.new(
    config_file: "libs/google/calendar/ds_credentials.secret.json",
    token_file: "libs/google/calendar/dsc_token.secret.yaml",
    calendar_name: destination_cal
  )
  result = source_calendar.copy_to_calendar(date: date, destination: destination_calendar, color_coding: color_coding)

  puts "\n📅  Events from #{source_calendar.name} copied successfully"
  result
end

puts "\n⌨️  Running populate_calendar script"
cl_date = CommandLine.get_date_from_command_line(ARGV)
date = cl_date.empty? ? Date.today.to_s : cl_date

copy_events(date: date, source_cal: "primary", destination_cal: "surykartka", color_coding: "")
copy_events(date: date, source_cal: "color_coded", destination_cal: "surykartka", color_coding: "7")
