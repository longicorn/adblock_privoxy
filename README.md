# adblock_privoxy
個人用privoxyでadblockする

## 使用方法
portはprivoxyのデフォルトの8118

```
$ docker compose up -d
```

起動時に毎回追加のフィルターを自動で追加する

### user設定
`./privoxy/` 以下に配置する

domainを追加したければ `user.action` に追加して起動し直せば良い
