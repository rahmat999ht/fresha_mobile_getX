```toml
name = 'patch product'
method = 'GET'
url = 'https://fresha-web-admin.vercel.app/api/product?hastag1=head&hastag2=cauliflower'
sortWeight = 1000000
id = '4c57d502-2ed6-4407-88d7-74ee7409ef3a'

[[queryParams]]
key = 'hastag1'
value = 'head'

[[queryParams]]
key = 'hastag2'
value = 'cauliflower'

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
