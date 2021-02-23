# DynamoDB の勉強

## local で DynamoDB を試す

Docker を使うとローカル環境で DynamoDB を試すことができる。

```powershell
docker pull amazon/dynamodb-local
docker run -d --name dynamodb -p 8000:8000 amazon/dynamodb-local 
```

## cli によるリクエスト方法

aws cli を使ってローカルの DynamoDB にアクセスするには `--endpoint-url` を使う

```powershell
aws dynamodb create-table `
--table-name "Test" `
--attribute-definitions `
    "AttributeName=id,AttributeType=S" `
    "AttributeName=timestamp,AttributeType=N" `
--key-schema `
    "AttributeName=id,KeyType=HASH" `
    "AttributeName=timestamp,KeyType=RANGE" `
--provisioned-throughput "ReadCapacityUnits=1,WriteCapacityUnits=1" `
--endpoint-url "http://localhost:8000"
```

## Table の作成について

DynamoDB のテーブルを作成する場合はパーティションキーを設定する。

また任意でソートキーを設定する。

それ以外の項目についてはスキーマレスであるため必要になったら追加することができる。

そのため DynamoDB のテーブルを作成する際はパーティションキーと必要ならソートキーを設定する必要がある。

またソートキーに使用できる属性は後から指定することも可能だがその場合は**ローカルセカンダリインデックス**となる。

因みにテーブル作成時に設定するソートキーは**グローバルセカンダリインデックス**と呼ぶ。

詳しくは[ここ](https://docs.aws.amazon.com/ja_jp/amazondynamodb/latest/developerguide/SecondaryIndexes.html)を参照。

```powershell
aws dynamodb create-table `
--table-name "Test" `
--attribute-definitions `
    "AttributeName=id,AttributeType=S" `
    "AttributeName=timestamp,AttributeType=N" `
--key-schema `
    "AttributeName=id,KeyType=HASH" `
    "AttributeName=timestamp,KeyType=RANGE" `
--provisioned-throughput "ReadCapacityUnits=1,WriteCapacityUnits=1" `
--endpoint-url "http://localhost:8000"
```
