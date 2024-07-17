```toml
name = 'patch product'
method = 'PATCH'
url = 'https://fresha-web-admin.vercel.app/api/product'
sortWeight = 1000000
id = '4c57d502-2ed6-4407-88d7-74ee7409ef3a'

[[headers]]
key = 'Content-Type'
value = 'application/json'

[body]
type = 'JSON'
raw = '''
{
  "id":"clyg4yzha0008o6pqngete6fo",
  "stock": 2
}'''
```
