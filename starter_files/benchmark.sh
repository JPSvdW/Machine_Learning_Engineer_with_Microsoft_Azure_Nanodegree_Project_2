This is ApacheBench, Version 2.3 <$Revision: 1879490 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 33162d9c-2531-40c5-b6ca-8fe480afafd2.southcentralus.azurecontainer.io (be patient)...INFO: POST header ==
---
POST /score HTTP/1.0
Content-length: 781
Content-type: application/json
Authorization: xDXBj8mXge0eCR8R3j501E7QSlMjEgTi
Host: 33162d9c-2531-40c5-b6ca-8fe480afafd2.southcentralus.azurecontainer.io
User-Agent: ApacheBench/2.3
Accept: */*


---
LOG: header received:
HTTP/1.0 400 Bad Request
Date: Mon, 20 Dec 2021 14:10:40 GMT
Content-Length: 96
Content-Type: text/plain; charset=utf-8

Authorization header is malformed. Header should be in the form: "Authorization: Bearer <token>"
WARNING: Response code not 2xx (400)
LOG: header received:
HTTP/1.0 400 Bad Request
Date: Mon, 20 Dec 2021 14:10:40 GMT
Content-Length: 96
Content-Type: text/plain; charset=utf-8

Authorization header is malformed. Header should be in the form: "Authorization: Bearer <token>"
WARNING: Response code not 2xx (400)
LOG: header received:
HTTP/1.0 400 Bad Request
Date: Mon, 20 Dec 2021 14:10:40 GMT
Content-Length: 96
Content-Type: text/plain; charset=utf-8

Authorization header is malformed. Header should be in the form: "Authorization: Bearer <token>"
WARNING: Response code not 2xx (400)
LOG: header received:
HTTP/1.0 400 Bad Request
Date: Mon, 20 Dec 2021 14:10:40 GMT
Content-Length: 96
Content-Type: text/plain; charset=utf-8

Authorization header is malformed. Header should be in the form: "Authorization: Bearer <token>"
WARNING: Response code not 2xx (400)
LOG: header received:
HTTP/1.0 400 Bad Request
Date: Mon, 20 Dec 2021 14:10:40 GMT
Content-Length: 96
Content-Type: text/plain; charset=utf-8

Authorization header is malformed. Header should be in the form: "Authorization: Bearer <token>"
WARNING: Response code not 2xx (400)
LOG: header received:
HTTP/1.0 400 Bad Request
Date: Mon, 20 Dec 2021 14:10:40 GMT
Content-Length: 96
Content-Type: text/plain; charset=utf-8

Authorization header is malformed. Header should be in the form: "Authorization: Bearer <token>"
WARNING: Response code not 2xx (400)
LOG: header received:
HTTP/1.0 400 Bad Request
Date: Mon, 20 Dec 2021 14:10:40 GMT
Content-Length: 96
Content-Type: text/plain; charset=utf-8

Authorization header is malformed. Header should be in the form: "Authorization: Bearer <token>"
WARNING: Response code not 2xx (400)
LOG: header received:
HTTP/1.0 400 Bad Request
Date: Mon, 20 Dec 2021 14:10:40 GMT
Content-Length: 96
Content-Type: text/plain; charset=utf-8

Authorization header is malformed. Header should be in the form: "Authorization: Bearer <token>"
WARNING: Response code not 2xx (400)
LOG: header received:
HTTP/1.0 400 Bad Request
Date: Mon, 20 Dec 2021 14:10:40 GMT
Content-Length: 96
Content-Type: text/plain; charset=utf-8

Authorization header is malformed. Header should be in the form: "Authorization: Bearer <token>"
WARNING: Response code not 2xx (400)
LOG: header received:
HTTP/1.0 400 Bad Request
Date: Mon, 20 Dec 2021 14:10:40 GMT
Content-Length: 96
Content-Type: text/plain; charset=utf-8

Authorization header is malformed. Header should be in the form: "Authorization: Bearer <token>"
WARNING: Response code not 2xx (400)
..done


Server Software:
Server Hostname:        33162d9c-2531-40c5-b6ca-8fe480afafd2.southcentralus.azurecontainer.io
Server Port:            80

Document Path:          /score
Document Length:        96 bytes

Concurrency Level:      1
Time taken for tests:   0.065 seconds
Complete requests:      10
Failed requests:        0
Non-2xx responses:      10
Total transferred:      2220 bytes
Total body sent:        10260
HTML transferred:       960 bytes
Requests per second:    153.86 [#/sec] (mean)
Time per request:       6.499 [ms] (mean)
Time per request:       6.499 [ms] (mean, across all concurrent requests)
Transfer rate:          33.36 [Kbytes/sec] received
                        154.16 kb/s sent
                        187.52 kb/s total

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        1    2   0.8      2       3
Processing:     4    4   0.5      4       5
Waiting:        4    4   0.5      4       5
Total:          5    6   0.8      6       7

Percentage of the requests served within a certain time (ms)
  50%      6
  66%      7
  75%      7
  80%      7
  90%      7
  95%      7
  98%      7
  99%      7
 100%      7 (longest request)
ab -n 10 -v 4 -p data.json -T 'application/json' -H 'Authorization: xDXBj8mXge0eCR8R3j501E7QSlMjEgTi' http://33162d9c-2531-40c5-b6ca-8fe480afafd2.southcentralus.azurecontainer.io/score
