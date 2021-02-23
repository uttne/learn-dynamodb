aws dynamodb query `
    --table-name "query-test" `
    --key-condition-expression '#id = :id and #timestamp < :timestamp' `
    --expression-attribute-names '{\"#id\": \"id\",\"#timestamp\": \"timestamp\"}' `
    --expression-attribute-values '{\":id\":{\"S\":\"c6d39481-44b2-4d5f-b0fc-d655e3e25693\"},\":timestamp\":{\"N\":\"637496791280296175\"}}' `
    --max-items 2 `
    --endpoint-url "http://localhost:8000"