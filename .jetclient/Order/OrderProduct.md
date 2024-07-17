```toml
name = 'OrderProduct'
method = 'POST'
url = 'https://fresha-web-admin.vercel.app/api/order'
sortWeight = 1000000
id = '9072f89f-d370-4307-9a43-50a2d3048ee0'

[[headers]]
key = 'Content-Type'
value = 'application/json'

[[headers]]
key = 'Authorization'
value = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNseW5kNHhnajAwMDB3OGpkcWh3dWp0dDUiLCJuYW1lIjoicmFtYSIsImltYWdlIjpudWxsLCJlbWFpbCI6InJhbWFqaWUxMTMwQGdtYWlsLmNvbSIsImVtYWlsVmVyaWZpZWQiOm51bGwsInBob25lIjpudWxsLCJhZGRyZXNzIjpudWxsLCJpc0FjdGl2ZSI6dHJ1ZSwiY3JlYXRlZEF0IjoiMjAyNC0wNy0xNVQxOToxMzo1Mi40ODRaIiwidXBkYXRlZEF0IjoiMjAyNC0wNy0xNVQxOToxMzo1Mi40ODRaIiwiaWF0IjoxNzIxMDcwODM5LCJleHAiOjE3MjEzMzAwMzl9.VlS63xVU7GI_kJQ-VyOi0ryZ--kwsufWlr8N8E6M3tY'

[auth]
type = 'BEARER'

[body]
type = 'JSON'
raw = '''
{
  "status": "processed",
  "totBuy": 30000,
  "orderById": "clynd4xgj0000w8jdqhwujtt5",
  "listProduct": [
    {
      "productId": "clyg4yzha0008o6pqngete6fo",
      "quantity": 2,
      "totPrice": 50
    },
    {
      "productId": "clyg4xy4r0007o6pq09981wnu",
      "quantity": 1,
      "totPrice": 30
    }
  ]
}'''
```
