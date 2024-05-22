# 英语学习APP

## 一、加入项目

1.首先再电脑任意位置新建一个名叫`gitee`文件夹，用于存放的仓库。

2.进入`gitee`目录并打开Git Bash，复制远程仓库的https链接。

![](images/Snipaste_2023-10-04_00-02-07.jpg)

然后直接执行`git clone`

![](images/Snipaste_2023-10-04_00-17-18.jpg)

> 仓库分支

master:主分支，项目可靠已经完成的功能代码。

dev:开发分支，每次提交首先提交的分支，确认无误再合并到master分支。

3.设置本地仓库分支与远程仓库保持一致

![](images/Snipaste_2023-10-04_00-27-55.jpg)

至此，设置完成然后可以对项目进行开发了！

---

例：对仓库文档修改/添加并提交远程仓库，再合并dev分支。

先push到dev分支

![](images/Snipaste_2023-10-04_00-38-17.jpg)

现在打开gitee，可以看到dev分支有test.txt文件，而master分支没有，dev比master优先一个版本。

![](images/Snipaste_2023-10-04_00-44-57.jpg)

![](images/Snipaste_2023-10-04_00-45-19.jpg)

然后将dev合并到master

master分支要合并dev分支就要先切换到master操作

![](images/Snipaste_2023-10-04_00-53-46.jpg)

查看远程仓库，两个分支数据同步了。

大功告成！！

> 以后使用可能会出现错误

![](images/Snipaste_2023-10-04_01-01-30.jpg)

原因是因为有其它成员修改了远程仓库，而你的本地仓库没同步上。git push 推送内容时就会报错。因此要先`git pull`拉取内容同步上。

解决办法：

![](images/Snipaste_2023-10-04_01-07-45.jpg)

避免：每次push前都应pull拉取一下。

## 二、业务分析

### 功能需求图

![](images/系统总体需求.jpg)

### 数据流图

![](images/Snipaste_2023-10-03_18-36-41.jpg)

### 业务流程图

![](images/Snipaste_2023-10-03_22-59-54.jpg)

## 三、项目架构

### 微信小程序前端目录

![](images/Snipaste_2024-05-22_13-41-12.jpg)

### 管理员前端

![](images/Snipaste_2024-05-22_16-29-06.jpg)

### 后端目录

![](images/Snipaste_2024-05-22_13-42-32.jpg)

## 四、页面展示

### 管理员页面

**发布文章**

![](images/Snipaste_2024-05-22_16-11-50.jpg)

### 微信小程序

**首页**

![](images/Snipaste_2024-05-22_13-36-27.jpg)

**文章阅读**

![](images/Snipaste_2024-05-22_13-37-39.jpg)

**答题学习**

![](images/Snipaste_2024-05-22_13-37-14.jpg)

![](images/Snipaste_2024-05-22_13-37-54.jpg)

**翻译**

![](images/Snipaste_2024-05-22_13-39-03.jpg)

**个人中心**

![](images/Snipaste_2024-05-22_13-39-26.jpg)