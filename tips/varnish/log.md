# Varnish Server check log to debug issues

## Filter by request host header
```bash 
varnishlog -q 'ReqHeader ~ "Host: example.com"'
```

## Filter by request url
```bash 
varnishlog -q 'ReqURL ~ "^/some/path/"'
```

## Filter by client ip (behind reverse proxy)
```bash 
varnishlog -q 'ReqHeader ~ "X-Real-IP: .*123.123.123.123"'
```

## Filter by request host header and show request url and referrer header
```bash 
varnishlog -q 'ReqHeader ~ "Host: (www\.)?example\.com"' -i "ReqURL" -I "ReqHeader:Referer:"
```

## Filter for permanent redirects and show request host/url and new location
```bash 
varnishlog -q "RespStatus ~ 301" -i "ReqURL" -I "ReqHeader:Host:" -I "RespHeader:Location:" -i "RespStatus"
```

## Filter for permanent and temporary redirects and filter for Location "http://s3" to just show (for example) redirects to something on an Amazon S3 bucket
```bash 
varnishlog -q '(RespStatus ~ 301 or RespStatus ~307) and RespHeader ~ "Location: https://s3"' \
   -i "ReqURL" -I "ReqHeader:Host:" -I "RespHeader:Location:" -i "RespStatus" -I "ReqHeader:Referer:"
```
