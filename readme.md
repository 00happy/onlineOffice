# OnlyOffice Document Server - Railway 部署

## 一键部署到 Railway

### 方式一：点击部署按钮

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/deploy)

### 方式二：手动部署

1. 登录 [Railway](https://railway.app)，新建项目
2. 选择 **"Deploy from GitHub repo"**，连接此仓库
3. 进入项目 **Variables** 页面，添加环境变量：

| 变量名 | 值 | 说明 |
|--------|-----|------|
| `JWT_SECRET` | 随机强密码 | JWT 认证密钥，务必设置 |

生成密码：`openssl rand -hex 32`

4. Railway 自动构建部署，等待 2-3 分钟
5. 部署完成后，在 **Settings -> Networking** 中开启公网访问，获得 `xxx.up.railway.app` 地址
6. 访问 `https://xxx.up.railway.app` 验证

### 方式三：Railway CLI

```bash
# 安装 CLI
npm i -g @railway/cli

# 登录
railway login

# 初始化并部署
railway init
railway up

# 设置环境变量
railway variables set JWT_SECRET=$(openssl rand -hex 32)

# 查看部署日志
railway logs
```

## 集成到你的应用

部署成功后，使用 Railway 分配的域名连接 Document Server：

```html
<div id="placeholder"></div>
<script src="https://xxx.up.railway.app/web-apps/apps/api/documents/api.js"></script>
<script>
new DocsAPI.DocEditor("placeholder", {
    document: {
        fileType: "docx",
        key: "unique_document_key",
        title: "Example.docx",
        url: "https://yourapp.com/files/example.docx",
    },
    documentType: "word",
    editorConfig: {
        callbackUrl: "https://yourapp.com/callback",
    },
});
</script>
```

## 注意事项

- Railway 免费额度：每月 $5，够测试使用
- 最低建议配置：2GB 内存，OnlyOffice 运行需要较多资源
- JWT_SECRET 务必设置强密码，防止未授权访问
- Railway 自带 HTTPS，无需额外配置证书
