# cssmgdb
## Introduction
cssmgdb is a lightweight MongoDB connector for your FiveM server.
## How to use
Firstly add your connection URI to the server .cfg, example:
[!] Remember to add your database in URI at the end (example: `/fivem`)
```cfg
set mongo_connection_uri mongodb://localhost:27017/fivem
```

Add this to `fxmanifest.lua`, in order to access MongoDB object
```
server_script '@cssmgdb/server/MongoDB.lua'
```
Now you can use MongoDB connector!

For more information visit [documentation](https://docs.csskrouble.me/)



#### This library no longer will be maintained.
