# CHICKEN app

Test URL shorten-r application. Takes a url and provides a short URL of it.

When shortened URL is visited it redirects to original provided url (and in background it also gathers some stats, which can be fetched via free REST API) .


* Ruby version: **2.4.2**

* Rails version: **5.2.0**

* Database creation: **rake db:create**

* Database initialization: **rake db:migrate**

* How to run the test suite: **rake -t**

* How to run the app locally(in development): **rails s**

* API request: 


    curl --request GET  --url http://some-dns.com/uri/<6 characters shortend id>
    
    curl --request GET  --url http://localhost:3000/uri/2TAa7F
    
