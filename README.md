# setup-pi-router

- raspberry pi router setup手順
- raspberry pi 4B+で動確

## 手順

- raspberry pi imagerのcustom imageでRaspAPを選択してmicro SDカードにimage焼付
- USBドングルを挿す
- 当該micro SDカードをraspberry pi 4B+に刺して起動
- chromeからRaspSP設定画面へアクセスし、パスワード変更
  - デフォルト設定
    - user: admin
    - pass: secret
- このgit repositoryをraspberry piへ送信して実行
  - `sudo ./init.sh`
