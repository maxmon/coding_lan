## 服务器地址

cq01-ps-dev199.cq01   -- 自己开发机

cp01-nuomi-search-1.epc.baidu.com   -- 线下调研

cp01-nuomi-search-2.epc.baidu.com   -- 线上离线任务产出

sh01-nuomi-bndata00.sh01.baidu.com  
/home/nuomi/brand-mining -- 团购品牌 old

nj03-nuomi-bnrankingdata00.nj03.baidu.com  
/home/nuomi/brand_mining  -- 团购品牌 now

## account

work账号， 密码 rec2016

## code

显示头/尾几行

```
cat xx.txt | tail -n 5 | iconv -f GBK
```

wget -r -c ftp路径名； 断点续传 file

```
wget -r -c sh01-nuomi-bndata00.sh01.baidu.com:/home/nuomi/brand-mining/data/*
```

查good_id

```
nuomi.com/?id=
```

kill进程

```
kill $(ps aux | grep 'brand_list' | awk '{print $2}')
```

查看进程 `ps`


## brand mining code

```
rm -rf .app.search.tuangou.data.brand-mining.001.dc .comake2.warnings title_compare brand_cluster brand_mining brand_find_core brand_filter_place .app.search.tuangou.data.brand-mining.COMAKE.CONFIGS.SCM .copy-conf test/main_ut_brand_mining  test/name_compare_init_test test/place_filter_test script/util output
```

```
./bin/brand_cluster name_compare_conf/ name_compare.conf name_parser_conf/ name_parser.conf 1110703 < ./middle/step2_res__1110703_part200 > ./middle/step2_res__1110703_part200_step3
```

```
perl ./script/compute_brand_num_2.pl "./middle/step4_res_part200" <"./middle/step4_res_part200" >"./middle/step5_res_part200"
```

```
perl ./script/gen_brand.nuomi.pl  "./middle/step1_res" ./name_compare_conf/brand_dict/brand_syn.txt  ./data/brand.txt ./output/brand_list.txt < "./middle/step5_res_part200" > "./middle/step6_res_part200"

perl ./script/gen_brand.nuomi.pl  "./middle/step1_res" ./name_compare_conf/brand_dict/brand_syn.txt  ./data/brand.txt ./output/brand_list.txt ./middle/perlog < "./middle/step5_res" > "./middle/step6_res_test"
```

## 部署服务器(nuomi)

第一次部署的临时权限

- [申请noah](http://noah.baidu.com/new/templates/new.html)
- 添加服务器地址（如ftp地址`nj03-nuomi-bnrankingdata00.nj03.baidu.com`）
- ![](./1.png)
- 使用糯米用户名部署 `ssh nuomi@xxxxx`

第一次部署完成之后  后续小的改动走noah上线的

[crontab 定时任务（推荐）](http://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/crontab.html)

```
crontab -e
```

自循环 & 后台执行

[守护进程brand_daemon.sh](./brand_daemon.sh)
[运行脚本brand_daemon.sh](./brand_daemon.sh)





