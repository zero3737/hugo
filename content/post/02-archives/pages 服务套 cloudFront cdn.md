---
date: 2025-03-16T22:01:59+08:00
title: pages 服务套 cloudFront cdn
tags:
  - aws
  - cdn
  - 域名
  - dns
  - github
categories:
  - 计算机网络
image: ./bg/59.webp
author: carlos
---

## 前言

pages 服务如何套 cloudFront cdn，加速国内网络。前提，必须拥有一张国内信用卡，不是储蓄卡。aws 账号不要作弊！不要作弊！不要作弊！

### CloudFront 免费套餐

```txt
AWS 免费套餐
1TB 的数据传出
1000 万次 HTTP 或 HTTPS 请求
200 万次 CloudFront 函数调用
每个月，永远免费
```

### 原理解析

**Cloudflare 的模式**

你需要在你购买域名的网站(比如可能是阿里云，可能是 namesilo，可能是 freenom 等等)那边把你的域名服务器(英文NameServer，一般简称NS)修改为 Cloudflare 的NS服务器，也就是说，需要 Cloudflare全面接管你的域名，接管后，你想要添加DNS解析(添加A记录)，就需要在 Cloudflare 中添加，而不是在你购买域名的服务商那边添加，添加解析时，把小云朵的开关打开，就会走 cdn，不打开就不会走 cdn。

**CloudFront 模式**

AWS 的 CloudFront 与 Cloudflare 工作模式不同，你无需(也无法)把你的域名交给 CloudFront 接管，要使用 CloudFront 做cdn，你需要准备两个域名：

- 你要套cdn的域名(A域名)：假设为“aa.test.com”；
- 源域名(B域名)：假设为“bb.test.com”。cdn是用于加速用的，你需要告诉cdn你要加速的内容(图片、视频、网站)存放在哪台服务器上，但不能填ip，只能填域名，所以你需要解析一个域名到你要加速的服务器上，这个域名就叫“源域名”。

CloudFront cdn 加速原理：就是把B域名(`bb.test.com`)解析到你的服务器上，然后在 CloudFront 的“选择源域”中填写B域名，这样 CloudFront 就知道你要加速的服务器是哪个服务器，最后它会自动生成一个`xxx.cloudfront.net`域名作为加速域名，然后你需要把你的网站域名(即你要套cdn的域名)“`aa.test.com`” cname 到“`xxx.cloudfront.net`”，最终效果就是你访问`aa.test.com`其实是在访问`xxx.cloudfront.net`(当然这是 cname，不是 301/302 跳转)，而`xxx.cloudfront.net`是 CloudFront 的域名，它会对应前面B域名所对应的那个网站。

### 举例说明

假设你现在有如下域名和服务器

```txt
A域名：aa.test.com
B域名: bb.test.com
服务器：11.22.33.44
```

1. 假设你想把A域名(`aa.test.com`)套到cloudflare cdn上，用cdn来加速这个域名；
2. 那么你需要先把B域名(`bb.test.com`)解析到你的服务器(11.22.33.44)；
3. 然后把B域名(`bb.test.com`)填到 CloudFront 的“选择源域”里，把A域名(`aa.test.com`)填到“备用域名(CNAME)”里(这一栏与前一栏不是挨着，需要往下滚动很多才能看到)；
4. 然后填好其它选项后，最终创建好之后，它会生成一个“`xxx.cloudfront.net`”格式的域名，这个域名就是 CloudFront 给你分配的加速域名，比如你之前访问一张图片是这样访问的：`aa.test.com/imgs/1.jpg`，而用了cdn之后就是：`xxx.cloudfront.net/imgs/1.jpg`；

按第4步的说法，虽然cdn可以加速，可是域名就变了，这是不可接受的，这就要用到前面第3步填的“备用域名”了，其实我觉得把它叫“自定义域名”更好一点，你需要添加一条DNS解析(CNAME记录)，把你在“备用域名”那一栏填的那个域名(`aa.test.com`)添加一个cname，对应到 CloudFront 给你分配的加速域名“`xxx.cloudfront.net`”，最终的请求的流向为

```txt
aa.test.com ====cname===> xxx.cloudfront.net ===> CDN服务器 ===bb.test.com===> 源服务器
```

## aws 控制台

打开以下地址，点击注册。创建账号不要作弊！不要作弊！不要作弊！

[Amazon CloudFront 内容分发网络(CDN)_免费CDN加速-AWS云服务](https://aws.amazon.com/cn/cloudfront/)

登录控制台，搜索 CloudFront 服务，

![](../00-assets/Pasted%20image%2020250316210608.png)

创建分配

![](../00-assets/Pasted%20image%2020250316210746.png)

然后在下图的“选择源域”中填写一个“源域名”

![](../00-assets/Pasted%20image%2020250316212250.png)

注意这个域名不能是你要套cdn的域名，这个域名只是用来告诉 CloudFront：“喂，你要加速的内容是`abc.examle.com`服务器中，记得给它加速哟”；它只能填域名，不能直接填ip，所以我们需要解析一个域名指向这个ip(你VPS的ip)，用域名的方式来告诉 CloudFront，告诉它要给哪台服务器的内容加速，这个域名我们叫“源域名”，它指向将要被加速的“源服务器”(就是你的VPS)；匹配查看器，其实就是匹配浏览器，“查看器”其实是browser的翻译，本来应该翻译为浏览器的，这aws的翻译也是厉害，不知道为什么会翻译成查看器的。

接着往下，这些按默认就可以。这里选择源域填了之后，自动和前面的一样，不用理会。

![](../00-assets/Pasted%20image%2020250316212456.png)

缓存策略选择“CachingDisabled”(禁用缓存)，源请求策略选择“AllViewer”。这里能禁用就禁用，其他服务需要收费，aws 服务小心一点。

![](../00-assets/Pasted%20image%2020250316212700.png)

禁用防火墙，这是收费服务

![](../00-assets/Pasted%20image%2020250316212837.png)

这里“价格与级别”，看你的服务器在哪儿，一般来说第一个和第三个都可以，仅北美和欧洲肯定不行，因为你在国内是亚洲，它不对亚洲加速的话，你要它来干嘛。这个价格可以不用太在意，因为你个人使用不超过免费用量是不会收费的。特别注意这里的“备用域名(CNAME)”一栏要填“你真正要套cdn的域名”(就是你的网站域名，就是你要加速的域名)

![](../00-assets/Pasted%20image%2020250316212917.png)

这里要选择证书，点击“请求证书”来申请一个证书，点击后它会在另一个标签中打开新页面，这个证书不需要我们源域名(`bb.test.com`)或网站域名(`bb.test.com`)的证书，就是说这个证书归这个证书，跟你自己域名的证书无关

![](../00-assets/Pasted%20image%2020250316213003.png)

默认下一步即可，证书认证，不然 cdn 加速失败

![](../00-assets/Pasted%20image%2020250316213202.png)

以 `*.baidu.com` 为例子，填你拥有的地址，dns 验证，默认下一步即可。

![](../00-assets/Pasted%20image%2020250316213302.png)

在域名控制台添加对应的记录，添加完等待认证成功即可。

![](../00-assets/Pasted%20image%2020250316213502.png)

认证成功截图

![](../00-assets/Pasted%20image%2020250316213620.png)

回到之前请求证书的地方，点击右侧的“刷新”按钮，然后下拉菜单中就可以选择刚刚请求的证书了

![](../00-assets/Pasted%20image%2020250316213754.png)

下图都默认就行，或者把 http3 也选上，最终点“创建分配”

![](../00-assets/Pasted%20image%2020250316213837.png)

可以看到显示创建成功，它会给你分配一个“分配域名”，然后下边还会有一个“备用域名”，这时你就会比较明白什么叫备用域名了，因为它已经给你分配了，你直接用它分配的域名就能用，但是用我们自己的域名通过添加cname后，也是可以走cdn加速的，所以才叫“备用域名”

![](../00-assets/Pasted%20image%2020250316213950.png)

这两个域名都可以用来访问你的网站，只不过备用域名的好处就是自定义，更像是你自己的域名，而自动分配的域名就统一是 CloudFront 的域名(如果是做代理用的话，用 CloudFront 分配的域名也没什么，就是可能不容易记住)。

`www.carlos2016.cfd` 为 `dcrl3j7vhd2m7.cloudfront.net` 别名

如果你想使用自定义域名(即上图的“备用域名”)，你需要在域名解析服务商那边添加一个cname记录，把自己要套cdn的域名作为名称，而把 CloudFront 给你分配的域名作为“目标”，添加之后就可以使用它了。

按照本例的示例域名，aa.test.com就是套了cdn的域名，你用aa.test.com访问你的网站就是走了cdn的，而bb.test.com则是一个用来中转用的域名，真实使用的时候并不使用它

```txt
aa.test.com ====cname===> xxx.cloudfront.net ===> CDN服务器 ===bb.test.com===> 源服务器
```

## 服务器端操作

CloudFront 会通过443端口和80端口，即https和http协议去请求你的服务器，你必须在你的服务器配置前面所说的“A域名”(套cdn的域名)和“B域名”(源域名)，如果是nginx，则server_name应该把`aa.test.com`和`bb.test.com`都写上

```nginx
server {
  listen 80;
  server_name aa.test.com bb.test.com;
  ……
}
```

`bb.test.com`作为源域名，不用说肯定要配置的，不然CDN服务器没法通过这个域名获取到源站的内容，而`aa.test.com`是cname到`xxx.cloudfront.net`，理论上来说`aa.test.com`并没有直接参与访问你服务器的内容，为什么它也要在nginx中配置呢？

原因是，你在浏览器(或其它客户端)发起请求的时候，用的是`aa.test.com`，虽然DNS那边最终会把cname的域名(即`xxx.cloudfront.net`)对应的ip返回，但浏览器并不知道这个ip是cname那边的，所以GET请求中header中的Host值还是`aa.test.com`，这个请求最终会被CDN服务器转发到你的VPS中，那么VPS中的nginx接收到这个请求，就会根据Host值判断应该用哪个server模块来处理你的请求(如果你同一个端口有多个模块的话)，当然如果同一端口只有一个模块，其实server_name可以不写`bb.test.com`，因为只有一个它默认就进去了，但建议还是写比较好。

另外，server模块中的证书，一般来说用通配符证书都是能匹配上，如果是单独指定多个域名，申请证书时记得把`aa.test.com`和`bb.test.com`的证书都加上。

## pages 服务 cdn 加速

填写 github 分配的地址即可，操作和上面的一样

![](../00-assets/Pasted%20image%2020250316215350.png)

域名控制台添加 cname 记录，将自己购买的域名指向 CloudFront 分配的域名

![](../00-assets/Pasted%20image%2020250316215444.png)

pages 自定义域名填写自己购买的域名

![](../00-assets/Pasted%20image%2020250316215706.png)

然后 cmd 测试，返回数据出现 CloudFront 特有的标记，就证明 cdn 开启成功

![](../00-assets/Pasted%20image%2020250316215901.png)

点击以下在线测试工具，就会发现中国绿

[在线ping_多地ping_多线路ping_持续ping_网络延迟测试_服务器延迟测试](https://www.itdog.cn/ping/)

![](../00-assets/Pasted%20image%2020250316220034.png)








