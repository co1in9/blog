#! /bin/sh

echo "deploy to Aliyun OSS"
hexo generate
ossutil cp -r -f public oss://co1in-public/