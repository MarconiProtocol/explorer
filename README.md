#### This repo is forked from https://github.com/ethereumclassic/explorer

# Marconi Explorer
This is a fork of [etcexplorer](https://github.com/ethereumclassic/explorer) that we've modified to work for [Marconi Protocol](https://marconi.org). 

**MainNet Explorer Live**: **[explorer.marconi.org](https://explorer.marconi.org/home)**  
**TestNet Explorer Live**: **[explorer.testnet.marconi.org](https://explorer.testnet.marconi.org/home)**  


## Dependencies
**[node.js](https://nodejs.org/en/)**  
**[mongodb](https://docs.mongodb.com/manual/installation/)**  

Install required npm packages:  
```
$ npm install
```

## Configuration
Clone a config file from the template and update the values.
```
$ cp config.example.json config.json
$ vi config.json
```

Sample `config.json`  
```json
{
    "nodeAddr":     "localhost",        
    "gethPort":     8545,
    "startBlock":   0,
    "quiet":        true,
    "syncAll":      true,
    "patch":        true,
    "patchBlocks":  100,
    "bulkSize":     10,
    "settings": {
        "symbol": "Marcos", 
        "name": "Marconi Protocol",
        "author": "Marconi Foundation",
    }
}
```

```nodeAddr```:    Your node API RPC address.  
```gethPort```:    Your node API RPC port.  
```startBlock```:  This is the start block of the blockchain, should always be 0 if you want to sync the whole blockchain.  
```quiet```:       Suppress some messages. (admittedly still not quiet)  
```syncAll```:     If this is set to true at the start of the app, the sync will start syncing all blocks from lastSync, and if lastSync is 0 it will start from whatever the endBlock or latest block in the blockchain is.  
```patch```:       If set to true and below value is set, sync will iterated through the # of blocks specified.  
```patchBlocks```: If `patch` is set to true, the amount of block specified will be check from the latest one.  

## Run
The below will start both the web-gui and sync.js (which populates MongoDV with blocks/transactions).  
```
$ npm start
```

You can leave sync.js running without app.js and it will sync and grab blocks based on config.json parameters  
```
$ node ./tools/sync.js
```

Enabling stats requires running a separate process:  
```
$ node ./tools/stats.js
```

You can configure intervals (how often a new data point is pulled) and range (how many blocks to go back) with the following.
The below sample is set to: New data point every 1,000 blocks. Go back 100,000 blocks:  
```
$ RESCAN=1000:100000 node tools/stats.js     
``` 
