# Example Event Logger

## setup

To run locally:
`bundle install`

`rake db:create db:migrate db:seed`

Run tests:

`rake test`

Overview of routes:

Organization urls are standard rest urls with the base url:
`/organizations`

Events are nested under Organizations so to list an organization's events use:
`GET /organizations/*org-name*/events`

To list all events from all organizations use the top level events resource:
`GET /events`
NOTE: this endpoint can ONLY list events and can not be used for any other actions

### Filters:

Count:
Filter by count by sending a param of `count` with an integer value
`/organizations/1/events.json?count=1`

Hostname:
Filter by hostname by sending a param of `hostname` with a value of the hostname string (case sensitive)
`/events.json?hostname=google.com`

Filter Mixing:
Filters can be combined and used together with the organization filter:
`/organizations/1/events.json?hostname=google.com&count=1`


Examples of use cases
