## delete cache
#### clean the disc cache in the terminal

`sync && echo 3 | sudo tee /proc/sys/vm/drop_caches`

#### After disc cache clean, reset mysql query cache

`RESET QUERY CACHE;`

### You can also, flush query cache, (doesn't remove queries but removes data)

`FLUSH QUERY CACHE;`
