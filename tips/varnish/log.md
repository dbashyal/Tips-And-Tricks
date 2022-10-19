# filter by request host header
varnishlog -q 'ReqHeader ~ "Host: example.com"'

# filter by request url
varnishlog -q 'ReqURL ~ "^/some/path/"'

# filter by client ip (behind reverse proxy)
varnishlog -q 'ReqHeader ~ "X-Real-IP: .*123.123.123.123"'

# filter by request host header and show request url and referrer header
varnishlog -q 'ReqHeader ~ "Host: (www\.)?example\.com"' -i "ReqURL" -I "ReqHeader:Referer:"

# filter for permanent redirects and show request host/url and new location
varnishlog -q "RespStatus ~ 301" -i "ReqURL" -I "ReqHeader:Host:" -I "RespHeader:Location:" -i "RespStatus"

# filter for permanent and temporary redirects and filter for Location "http://s3" to 
# just show (for example) redirects to something on an Amazon S3 bucket
varnishlog -q '(RespStatus ~ 301 or RespStatus ~307) and RespHeader ~ "Location: https://s3"' \
   -i "ReqURL" -I "ReqHeader:Host:" -I "RespHeader:Location:" -i "RespStatus" -I "ReqHeader:Referer:"
