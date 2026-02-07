# 🔎 Private Golinks Server
Simple implementation of Golinks server for private use. Supports multiple domains and can restrict access to selected IP addresses. At the moment it has no UI nor stats tracking.

### Requirements
* Ruby v2.6.3
* Rails v6
* Postgres

### Setup
* Create the database user `createuser -dlP golinks`
* Install dependencies `bundle install`
* Setup the database `rails db:setup`

### Deployment
1. deploy the server
2. create a `go.yourdomain.com` CNAME for it
3. make sure your internal networks have `yourdomain.com` as search domain
