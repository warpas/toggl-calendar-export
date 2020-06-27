require_relative "../libs/command_line"
require_relative "../libs/toggl/report"
require_relative "../libs/toggl/google_calendar_adapter"
require_relative "../libs/google/calendar"
require "date"

def build_daily_summary(date_string)
  date = Date.parse(date_string)
  toggl = Toggl::Report.new(date)
  adapter = Toggl::GoogleCalendarAdapter.new
  adapter.build_daily_summary_from(report: toggl.report_details, report_day: date, category: "game")
end

puts "\n⌨️  Running daily_creative_report script"
date = CommandLine.get_date_from_command_line(ARGV)

date_string =
  if date.empty?
    yesterday = Date.today - 1
    yesterday.to_s
  else
    date.to_s
  end
prepared_entry_list = build_daily_summary(date_string)
puts "prepared_entry_list = #{prepared_entry_list}"

puts "\ninitiating Google Calendar integration"
calendar = Google::Calendar.new
calendar.add_list_of_entries_no_duplicates(prepared_entry_list)