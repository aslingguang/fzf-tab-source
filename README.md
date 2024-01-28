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

### arch 用户安装

```bash
yay -S fzf-tab-source
# 添加加载脚本到~/.zshrc中
source /opt/fzf-tab-source/fzf-tab.plugin.zsh
```

NOTE: fzf-tab-source needs to be loaded after compinit, but before plugins which will wrap widgets, such as zsh-autosuggestions or fast-syntax-highlighting!!
注意：fzf-tab-source 需要在 compinit 之后加载，但需要在 zsh-autosuggestions或fast-syntax-highlighting等插件之前

### 手动安装

下载源码到到任意位置(如/opt)并启用配置即可(建议使用方法3,管理插件更简单)

```bash
git clone https://github.com/aslingguang/fzf-tab-source.git /opt/fzf-tab-source
# 添加加载脚本到~/.zshrc中
source /opt/fzf-tab-source/fzf-tab.plugin.zsh
```

### zinit 安装

编辑`~/.zshrc`添加以下内容

```bash
zinit light Aloxaf/fzf-tab
```

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
