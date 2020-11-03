# 使用 acme.sh 自动申请泛域名证书

## 安装

```shell
curl  https://get.acme.sh | sh
```

## 使用 DNS API 申请证书

个人使用的是腾讯云的 DNSPod 解析服务，通过其提供的 API 可以自动添加 txt 解析以验证域名有效性

账号信息会存储在`~/.acme.sh/account.conf`

```shell
# 通过环境变量设置，信息会存在
export DP_Id="1234"
export DP_Key="sADDsdasdgdsf"

acme.sh --issue --dns dns_dp -d '*.co1in.com'
```

申请后的证书文件

```
/root/.acme.sh/*.co1in.com/
|-- ca.cer
|-- *.co1in.com.cer
|-- *.co1in.com.conf
|-- *.co1in.com.csr
|-- *.co1in.com.csr.conf
|-- *.co1in.com.key
`-- fullchain.cer
```
