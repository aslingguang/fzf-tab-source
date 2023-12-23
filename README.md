# fzf-tab-source
## 介绍
基于fzf-tab，替代zsh的命令补全功能，加入文件和目录预览，可使用rg或rga辅助fzf搜索
![image](https://github.com/aslingguang/fzf-tab-source/assets/74995823/02df5260-bc48-4169-9e73-d1aaac3a3c5c)
![image](https://github.com/aslingguang/fzf-tab-source/assets/74995823/7846c09a-d83f-4b0b-93f8-a3e3dd2f468f)
![image](https://github.com/aslingguang/fzf-tab-source/assets/74995823/68b99a1d-d041-45b7-a00a-e11580e15e55)
![image](https://github.com/aslingguang/fzf-tab-source/assets/74995823/b132e672-6b69-4ae6-bc0e-5f3f76ab40e7)
![image](https://github.com/aslingguang/fzf-tab-source/assets/74995823/2c8ea771-bf7f-4591-854b-2ad2928f07c4)
![image](https://github.com/aslingguang/fzf-tab-source/assets/74995823/7cb1f641-6e0f-45ce-b3fb-93908cc084fa)
![image](https://github.com/aslingguang/fzf-tab-source/assets/74995823/20713b23-0452-4a9a-bad9-ca8063592f82)
![image](https://github.com/aslingguang/fzf-tab-source/assets/74995823/44a555a9-9e6f-48b6-83fa-f511cab26ad2)
![image](https://github.com/aslingguang/fzf-tab-source/assets/74995823/6d3b1b7e-ce22-4dfc-8cc8-d3760728ebec)
![image](https://github.com/aslingguang/fzf-tab-source/assets/74995823/83ed8500-4d89-47cb-924d-9739d6fdc6cc)
![image](https://github.com/aslingguang/fzf-tab-source/assets/74995823/5d34ce81-92b3-422d-931f-d4c33c2b27d1)
![image](https://github.com/aslingguang/fzf-tab-source/assets/74995823/d8040cdd-d9d3-42d2-ba5a-09fa7e934530)


## 安装
### arch linux 用户安装

```bash
# 通过yay 安装软件可直接使用fts命令管理插件
yay -S fzf-tab-source
```

### 非arch linux 用户安装
下载源码到到任意位置(如/opt)并启用配置即可(建议使用方法3,管理插件更简单)
```bash
git clone https://github.com/aslingguang/fzf-tab-source.git /opt/fzf-tab-source
```

### 启用插件

1.方法1：编辑`~/.zshrc`,添加以下内容以启用插件(自己添加要注意路径)
```bash
source /opt/fzf-tab-source/fzf-tab.plugin.zsh
```
2.方法2：在安装目录终端运行`bash ./install.sh`和`bash ./uninstall.sh`可以快速启用和停用插件

3.方法3：使用fts-atuo.sh脚本
```bash
# 为脚本添加可执行权限
sudo chmod +x /opt/fzf-tab-source/fts-auto.sh
# 添加命令别名，这样就可以在任意路径下使用fts命令快速启用和停用
echo "alias fts='/opt/fzf-tab-source/fts-auto.sh'" >> ~/.zshrc
```
![image](https://github.com/aslingguang/fzf-tab-source/assets/74995823/cce036ec-9e87-4af3-a230-f8ed935ba118)

fts -a :启用插件

fts -d :禁用插件

fts -s :查看状态(启用或禁用)

fts -h :帮助信息


注意：使用fts管理插件在当前终端会话立即生效，但已经打开的其他会话需要重新加载~/.zshrc,可以使用fts -u更新配置

## 使用

### 常用使用方式
1.fzf命令

2.ls,cat,vim等命令后接空格按下tab

3.rf命令：使用rg辅助fzf搜索

4.rfa命令：使用rga辅助fzf搜索(相比于rg，rga还可以搜索docx、pdf、zip等文件内容等,但速度比起rg较慢,rfa同理)

### 快捷键
可用的键绑定：

Ctrl+Space：选择多个结果，可通过标签配置fzf-bindings

F1/F2：组间切换，可通过标签配置switch-group

/：触发连续补全（在完成深路径时有用），可通过标签配置continuous-trigger

可用命令：

disable-fzf-tab：禁用 FZF 选项卡并回退到 Compsys

enable-fzf-tab：启用 FZF 选项卡

toggle-fzf-tab：切换 FZF 选项卡的状态。这也是一个 zle 小部件。


## 参考
[fzf](https://github.com/junegunn/fzf)
[fzf-tab](https://github.com/Aloxaf/fzf-tab)




