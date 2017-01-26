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


## Examples of use cases:

### Create a new organization
Post to `/organizations.json` with a root key of `organization`

``` bash
curl --request POST \
  --url http://localhost:3000/organizations.json \
  --header 'cache-control: no-cache' \
  --header 'content-type: multipart/form-data; boundary=---011000010111000001101001' \
  --header 'postman-token: 00eee216-ffe0-97ba-baeb-19546a2dd725' \
  --form 'organization[name]=verizon'
```

### List all organizations
Get `/organizations.json`

``` bash
curl --request GET \
  --url http://localhost:3000/organizations.json \
  --header 'cache-control: no-cache' \
  --header 'content-type: multipart/form-data; boundary=---011000010111000001101001' \
  --header 'postman-token: 78f3d5ba-6748-fa6d-08cd-47e352caf1c5' \
  --form 'organization[name]=verizon'
```

### Delete an organization and all of its events
Delete to `/organizations/*ID*.json`

``` bash
curl --request DELETE \
  --url http://localhost:3000/organizations/1.json \
  --header 'cache-control: no-cache' \
  --header 'content-type: multipart/form-data; boundary=---011000010111000001101001' \
  --header 'postman-token: 4cc0f91f-132d-3056-227d-ea1b5d969299' \
  --form 'organization[name]=verizon'
```

### Create a new Event
Post to `/organizations/*NAME*/events.json` with a root key of `event`

``` bash
curl --request POST \
  --url http://localhost:3000/organizations/Google/events.json \
  --header 'cache-control: no-cache' \
  --header 'content-type: multipart/form-data; boundary=---011000010111000001101001' \
  --header 'postman-token: 6de848c4-ff10-7243-390f-6393865906c2' \
  --form 'event[body]=an event' \
  --form 'event[hostname]=google' \
  --form =
```

### List all Events for all Organizations
Get `/events.json`
NOTE: filters can be used on this request

``` bash
curl --request GET \
  --url http://localhost:3000/events.json \
  --header 'cache-control: no-cache' \
  --header 'postman-token: caabc511-bfc4-1f89-0946-fc2a58b31e1c'
```

### List all Events for an Organization
Get `/organizations/*name*/events`
NOTE: filters can be used on this request

``` bash
curl --request GET \
  --url http://localhost:3000/events.json \
  --header 'cache-control: no-cache' \
  --header 'postman-token: caabc511-bfc4-1f89-0946-fc2a58b31e1c'
```
