aws dynamodb put-item `
    --table-name "query-test" `
    --item "file://item.json" `
    --endpoint-url "http://localhost:8000"