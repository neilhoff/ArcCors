### Initial Setup

1. Run `npm install` in the `root` and `/client` folders
2. Run `npx arc hydrate` from the `root`


### Run the Servers

- From the `root` run `npm start`
    - This will kick off the Quasar web server at localhost:8080 and the Architect Sandbox at localhost:3333

### Test CORS

Navigate to http://localhost:8080 and click on the buttons for GET and POST

They will both fail

### Fix CORS

Open the file `/node_modules/@architect/sandbox/src/http/middleware/_cors.js`

Add this after line 11: `else next()`

The file will now look like this:

```node

module.exports = function handleCors (req, res, next) {
  if (process.env.ARC_SANDBOX_ENABLE_CORS) {
    res.setHeader('access-control-allow-origin', '*')
    res.setHeader('access-control-request-method', '*')
    res.setHeader('access-control-allow-methods', 'OPTIONS, GET')
    res.setHeader('access-control-allow-headers', '*')
    if (req.method === 'OPTIONS') {
      res.writeHead(200)
      res.end()
      return
    }
    else next()
  }
  else next()
}

```

Restart the servers