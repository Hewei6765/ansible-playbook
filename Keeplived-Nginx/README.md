# ansible-playbook

1. 修改host文件下IP地址,master只允许有且一个地址,backup至少包含一个地址
  【nginx】
  master
  backup地址
2. 修改变量group_vars文件里变量,需要关心的是IP地址以及网卡名称
3. 确保所有机器网卡名称所属的网段一致

 ansible-playbook site.yml -i host
