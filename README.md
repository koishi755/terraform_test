# terraform

# terraformのインストール
zypper addrepo https://download.opensuse.org/repositories/openSUSE:Leap:15.2/standard/openSUSE:Leap:15.2.repo
zypper refresh
zypper install terraform


# aws cliのインストール
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# aws cliの設定
aws configure --profile terraform
export AWS_PROFILE='terraform'
export AWS_ACCESS_KEY_ID='アクセスキー'
export AWS_SECRET_ACCESS_KEY='シークレットアクセスキー'


# 初期設定　.terraform/が作成される
terraform init

# 見やすくする 
terraform fmt

# 構文のチェック
terraform validate

# 実行（tfファイルと同じディレクトリで）
terraform apply

# 状態の確認
terraform show

# 終了
terraform destroy

# 変数の内容を変更できる
terraform apply -var 'instance_name=YetAnotherName'