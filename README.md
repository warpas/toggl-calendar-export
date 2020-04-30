# Toggl -> Google Calendar exporter
A simple Ruby script to export time logged through Toggl to Google Calendar

## Getting started

- Generate Google Calendar credentials in the first step of [their Ruby tutorial](https://developers.google.com/calendar/quickstart/ruby). Move and rename that file as `google/credentials.secret.json`.
- Add Toggl config file. *Detailed description and/or template to be added here.*

---

## Work outline

1. Simplest possible export

    ✅ take total time logged yesterday

    ✅ create a single hour-long Google Calendar event on the same day

    ✅ put the duration in the event's description

    ✅ all of the configuration stored in `.<file_name>.secret` files

2. Next step - Improved accuracy

    ✅ create more than one event, preferably with parity between Toggl and Calendar durations

    ✅ figure out how to handle time entries shorter than 15 minutes

    ✅ distinguish between Toggl projects

    ✅ add the option to input date instead of "days ago"

    ✅ add the weekly summary entry for "Work" calendar

3. Next step - Streamlining configuration and release

    ✅ minimize required configuration (too many `*.secret` files now)
    - add the ability to specify the calendar receiving input without messing with config files
        - add a query for a list of all calendars from Google Calendar if possible
    - streamline public interfaces
    - add tests
    - specify the shape of v1.0
    - add 'Getting started' section

4. After v1.0

    - move to Github issues after this point

5. Nice to have, but not necessary

    - choose the output calendar according to Toggl time entry tag
        - primary calendar as a fallback
    - add the function for copying all events from one calendar to another calendar
        - reson: I've got some legacy calendars that I want to get rid of
    - add the ability to change calendar entry color
    - add the ability to specify Toggl workspaces
    - RescueTime API before or after v1.0
    - probably have separate gems for outside services
