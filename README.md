# Hadoop 2.7.1 base Docker image
這是一個利用Docker製作的Apache Hadoop 2.7.1基底映像檔。
利用Ubuntu14.04當基底映像檔配置Hadoop 2.7.1的所有檔案在內。
請注意!! 該版本並沒有辦法啟動Hadoop，單純只是基底映像檔!!!

# 建立映像檔
如果你想要自行建立的話請到專案資料夾進行Dockerfile的映像檔建立。
```
docker build -t bimsj-hadoop2.7.1-base .
```

# 下載映像檔
這個映像檔未來也會釋出到Docker官方的公開倉庫。

# 測試映像檔
該映像檔並沒有部署Hadoop的功能單純只是把Hadoop所需要的檔案包進去，所以測試只是查看檔案是否正常。
如果需要進行Docker上的Hadoop部署請參考另一篇 bimsj-hadoop2.7.1-cluster
```
docker run -it bimsj-hadoop2.7.1-base bash
```
