# README

## 環境構築方法
リポジトリ作成手順書は[こちら](https://gist.github.com/nishina555/fde9a4fd43436e201e40db9997ae2ac1)

## 別リポジトリとして開発を進める場合

```
### 別プロジェクト名でこのリポジトリをcloneする
$ git clone git@github.com:nishina555/docker-rails6-api-mysql8.git [project_name] && cd [project_name]

### push先を変更
$ git remote set-url origin git@github.com:nishina555/[project_name].git

### push先の確認
$ git remote -v

### push
$ git push origin HEAD
```

clone後、ソースコードのプロジェクト名を変更する。大文字小文字を識別して、以下の文字列を置換する。

- `rails6_api_mysql8`を'[project_name]'に置換
- `RAILS6_API_MYSQL8`を'[PROJECT_NAME]'に置換
- `Rails6ApiMysql8`を'[ProjectName]'に置換
