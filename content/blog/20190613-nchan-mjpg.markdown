---
date: 2019-06-12T23:01:44+02:00
description: Nginx Nchan MJPEG
author: "Thomas Kerpe"
tags:
- nginx
- mjpeg
- nchan
- experiment
title: Using the Nchan module to stream images over HTTP.
lang: en
---

Extract from my MJPEG-Nchan-experiment today.
(Nchan is no streaming server, this is just for educational purposes :-) )


> Nchan is a scalable, flexible pub/sub server for the modern web, built as a module for the Nginx web server.
https://nchan.io


## Motion JPEG (MJPEG)

> In multimedia, Motion JPEG (M-JPEG or MJPEG) is a video compression format in which each video frame or interlaced field of a digital video sequence is compressed separately as a JPEG image.
[Wikipedia: Motion JPEG](https://en.wikipedia.org/wiki/Motion_JPEG)



### Example MJPEG HTTP session:

```
HTTP/1.1 200 OK
Server: Nginx/1.10.3
Connection: close
Content-Type: multipart/x-mixed-replace; boundary=--boundary

--boundary
Content-Type: image/jpeg
Content-Length: [size in bytes]

[raw jpeg data]

--boundary
Content-Type: image/jpeg
Content-Length: [size in bytes]

[raw jpeg data]

[…]
```


## Nginx+Nchan Configuration

Requirements: nginx with nchan module - Debian: *nginx-extras*

```nginx

client_max_body_size 25M;

server {
    listen 80;
    root /srv/http/nchandemo;
    server_name _;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ /mjpeg_pub/(\w+)$ {
        nchan_publisher;
        nchan_channel_id $1;
        nchan_channel_group mjpeg;
        nchan_message_buffer_length 5;
        nchan_message_timeout 5m;
    }

    location ~ /mjpeg/(\w+)$ {
        add_header Content-Type "multipart/x-mixed-replace; boundary=--boundary";
        nchan_subscriber http-raw-stream;
        nchan_channel_id $1;
        nchan_channel_group mjpeg;
        nchan_subscriber_first_message newest;
    }
}
```


## HTML Document
/srv/http/nchandemo/mjpeg.html
```html
<html>
<h1>MJPEG Stream</h1>
<img src="/mjpeg/img" width="640px" height="480px"/>
</html>
```


## Publish Script

stream_frame.sh
```sh
#!/usr/bin/env sh

set -e

: "${PUBLISH_URL:=http://127.0.0.1:80/mjpeg_pub/img}"

image="${1:-}"
[ $# -gt 0 ] && shift

[ ! -e "$image" ] && echo "File not found" && exit 1

(
    printf -- '%s\n' "--boundary" "Content-Type: text/jpeg"
    printf -- 'Content-Length: %s\n\n' "$(stat --printf='%s' $image)"
    cat $image
    printf -- '\n\n'
) | curl --request POST --data-binary @-  "$PUBLISH_URL"

# vim: set ft=sh :
```


## Test it

* Start the nginx server with the config above.
* Open the url http://127.0.0.1/mjpeg.html in a webbrowser capable of playing MJPEG (i.e Firefox).
* Run `./stream_frame.sh <JPEG_FILE.jpg>`
* Repeat…

