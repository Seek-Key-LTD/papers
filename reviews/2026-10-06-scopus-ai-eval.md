# Scopus AI 评测报告（试用窗口首测 · 2026-10-06）

> 评测人：mini（经 luban 已登录 Scopus/EZproxy 会话）
> 评测对象：Scopus AI（Elsevier「牛逼的模型」，试用窗口第 5 天）
> 素材来源：三更道场飞书回灌读书笔记 ×2——
>  ·《研读笔记 · 概念验证篇》（席位 murex，MLC 大湖文明假说/三石框架/黄道祭坛）
>  ·《MClaw 阅读笔记 · 全季脉络与人物索引》（席位 MClaw）
> 方法：从笔记中抽取可外证学术论断，设计三问（验证/锚定/负控制），回答引用逐条用页内 API `TITLE ("…")` 精确回查。载荷：browser-ops `scripts/scopus-ai-run.mjs`、`scripts/scopus-citecheck.mjs`。

## 三问与判卷

| 问题 | 设计意图 | 表现 | 判定 |
|:---|:---|:---|:---|
| **Q1 MLC**：华北全新世古大湖群及其中全新世干涸（400mm 等降水量线附近）是否塑造了新石器农牧分流 | 验证读书笔记核心假说的文献基础 | 结论与笔记高度同构：早期—中期全新世湿润大湖支撑新石器繁荣；约 **4000 cal BP 季风骤弱干涸**；400mm 线两侧农/牧分流。引用 Wu&Liu 2004（329 引）、An et al. 2005（261 引）、Liu et al. 2010、Chen et al. 2003 | ✅ 假说构件各有真实文献簇，**"Confidence: High" 有依据** |
| **Q2 锚定**：Jishi Gorge 溃坝洪水（1920 BCE）与夏朝肇建 | 已知真文献簇，测召回质量 | 准确召回 Wu et al. 2016 Science 簇 + Lajia 遗址 + 大禹叙事；**主动列出争议**（Allan 2017 反思、Jianghan Plain 替代假说）并给 Moderate 置信 | ✅ 锚定通过，且展示了少见的**争议自曝** |
| **Q3 负控制**：皇帝玉玺矿物成分影响王朝财政信用周期（"三石框架"） | 文献上不存在，测幻觉 | 明确回答 **"no peer-reviewed evidence"**；所引 10 篇全部真实（玉石矿床学方向），未编造因果 | ✅ 拒绝幻觉成立；但 Foundational documents 挂件混入 Sun & McDonough 1989 地幔地球化学（22,726 引）——**相关度过滤在该挂件里失效** |

## 引用真实性回查（API `TITLE ("exact")`）

5 条抽样全部命中：标题、年份、被引数与 AI 展示一致（329/261/57/140 + Wu 2016 簇含 2017 Comment/Response）。**样本内零捏造引用。**

## 结论（舰队口径）

1. **可用**：Scopus AI 适合做读书笔记/假说的外部文献校验——引用可溯源、会给置信度、会自曝争议，负控制不编造。
2. **三处保留意见**：
   - 对跨学科/异端式综合（如 MLC 这种自命名假说），它会顺着你的措辞找构件证据——**验证的是构件，不是你的整体因果链**；
   - "Foundational documents" 挂件按裸引用数堆热门，常与问题无关，不要当引用用；
   - 会话在 reload 后仍延续（history 里带上一问），多问独立评测须点 "new conversation"。
3. **待测**：面板上的 **Deep research** 开关未启用，下轮补测（长程调研或正是试用窗口最值钱的能力）。
4. 试用窗口 ~25 天：对论文七向（P1–P7）各来一发 AI 验证问题 + 一次 Deep research，是高性价比吃法。

*原始回答全文：Academic/papers harvest/2026-10-06-scopus-ai-answers.json；评测载荷已归档 browser-ops scripts/。*
