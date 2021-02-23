aws dynamodb create-table `
    --table-name "query-test" `
    --attribute-definitions `
    "AttributeName=id,AttributeType=S" `
    "AttributeName=timestamp,AttributeType=N" `
    --key-schema `
    "AttributeName=id,KeyType=HASH" `
    "AttributeName=timestamp,KeyType=RANGE" `
    --provisioned-throughput "ReadCapacityUnits=1,WriteCapacityUnits=1" `
    --endpoint-url "http://localhost:8000"