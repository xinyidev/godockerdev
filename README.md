# go docker 运行

## GoLand环境

### docker开启远程访问

查看docker配置文件
```
systemctl status docker
```

修改docker配置文件
```
sudo vi /lib/systemd/system/docker.service
```
追加`-H tcp://0.0.0.0:2375`
```
[Service]
Type=notify
# the default is not to use systemd for cgroups because the delegate issues still
# exists and systemd currently does not support the cgroup feature set required
# for containers run by docker
ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock -H tcp://0.0.0.0:2375
```

重启生效
```
systemctl daemon-reload 
systemctl restart docker
```

### 配置GoLand
![image](https://ftp.bmp.ovh/imgs/2021/04/ab20f249f0976641.png)

点击运行即可
![image](https://ftp.bmp.ovh/imgs/2021/04/5f1480484f3d09c2.png)





