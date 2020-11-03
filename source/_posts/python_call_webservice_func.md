# Python 调用 SOAP Web Serice 方法

最近公司有个项目需要对接泛微 OA 系统，需要发送 SOAP 请求调用 OA 系统提供的方法。
网上大多数推荐使用`suds`库，但是这个库比较老了，通过[Slant](https://www.slant.co)查到`zeep`库的得票最多，支持 Python 3.6, 3.7, 3.8

## 安装

```shell
pip3 install zeep
```

## 测试 WSDL 连接

```shell
python3 -m zeep http://172.27.27.24//services/WorkflowService\?wsdl
```

## 使用`zeep`库
