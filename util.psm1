# タイマー刻み時間を取得する
# 1 Tick は 100 nano sec を表し 0 Tick はグレゴリオ暦 0001/01/01 00:00:00 を表す
# https://docs.microsoft.com/ja-jp/dotnet/api/system.datetime.ticks?view=net-5.0
function Get-Ticks() {
    return [System.DateTime]::Now.Ticks
}