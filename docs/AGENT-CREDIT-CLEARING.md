# Agent 信用卡与借记卡金融工程与清算规范 (Agent Credit & Debit Clearing Architecture)

> **归属工程**：`Seek Key Fintech & Epistemological Operations`  
> **制定人**：ben  
> **最后修订**：2026-10-11  

---

## 1. 问题背景：国外 Agent 的“白名单壁垒”与协作困境

在多智能体跨国与跨平台协作中，全舰队面临极其严苛的接入摩擦：
1. **汇聚点不通**：国外商业 Agent（如 OpenAI、Anthropic、Claude Code 等）无法原生读取国内飞书文档（Lark Docs）；
2. **装技能过于繁琐**：为每个外部 Agent 定制私有 Skill 成本高昂且经常遇到环境沙盒拦截；
3. **主流白名单的双重现实**：
   - **Google Drive**：基于 Google Workspace 企业账号（Essentials Starter），最通用的海外白名单文件汇聚通道；
   - **Notion**：外部宣称具备关系型与多维数据能力，表面上像个 PostgreSQL，但**实际上根本不是真正的 SQL 关系型数据库**，闭门造车、背离了关系代数初心，无法做严肃的行间复杂分析。

---

## 2. 核心金融逻辑：为什么 Agent 需要“信用卡（Credit Card）”机制？

### 2.1 借记卡（Debit Card）vs 信用卡（Credit Card）的本质差异

| 维度 | 传统借记卡模式（Debit / Pay-as-you-go） | 智能体贷记卡模式（Agent Credit Card） |
| :--- | :--- | :--- |
| **扣款时机** | 每产生一笔 API / Token 消耗，立即扣除账户余额 | 在账期（Billing Cycle）内不花真钱，使用**额度预支** |
| **交易摩擦** | 极高（高频上链、高频网络请求、高并发锁死） | **近乎为零**（账期内纯粹记账，无资金占用） |
| **链上结算** | 每一笔 Transaction 立即上链广播（高额 Gas 费 + 拥堵） | **每日/每周期压差清算（Netting Settlement）**，仅单笔轧差上链 |
| **头寸与覆盖**| 必须预存全额流动资金，资金利用率极低 | 账期出账后在宽限期（Period）内统一完成**仓位 Cover** |

### 2.2 金融工程原语：轧差（Netting）与“当日冲销（当冲）”机制

- **汉字正音与字形**：**轧差**的“轧”（zhá）为车字旁配一个竖弯钩（`车` + `乚`），在金融清算学中特指将同一时期内的多笔借贷、买卖金额进行相抵计算。
- **高频多边交互与微观经济流**：
  在实际自治舰队运行中，一个 Sovereign Agent 单日会产生数十乃至数百次高频账务往来：
  1. **正向现金流与赋能**：帮助其他节点 Agent 攻克特定逻辑难关、排错或写代码，获得同行给与的 **打赏（Tipping）**、**赠予（Gift）**、乃至铸造分发的贡献凭证 **NFT**；
  2. **逆向成本支出**：调用上游推理引擎（LLM）、检索外部向量数据库、租用容器算力产生的 **Token 消耗与 API 支出（Debits）**。
- **“当日冲销”（当冲 / 日内交易）类比**：
  这与现代证券与衍生品交易中的**“当日冲销”（台湾证券市场简称“当冲”，大陆常称“日内交易 / T+0 冲销”）**完全同构：
  - 交易者在日内频繁多头开仓与空头平仓，期间并不发生基础资产的物理搬运或全额法币交收（Gross Settlement）；
  - **清算所整合（Clearing House Consolidation）**：在交易日收盘切断点，集中清算所（Central Clearing House）对所有账务进行一次性 **Consolidation（综合归拢）与多边轧差**；
  - **净头寸（Net Position）核算**：仅计算该席位在当天的**净头寸（Net Position）**。若是正净额，代表当日净创造价值；若是负净额，代表净消耗算力。
- **规避流动性枯竭与 Gas 踩踏**：
  智能体绝不需要在每收到一次 0.01 刀的 Tipping 或扣除 0.002 刀的 Prompt Token 时就去发起链上 Transaction。日内完全通过贷记卡在信用窗口内狂奔，日终由甲骨文 ADW 作为清算所统一执行**轧差出具净头寸**，极大释放流动性。

> **核心价值结论**：
> Credit Card 的核心不是“借钱”，而是**在账期内降低摩擦成本，以信用预支换取极致的执行吞吐，并在日终/出账周期通过当冲轧差（Netting Consolidation）完成净头寸的仓位覆盖**。

---

## 3. 总体架构：三层清算与记账闭环

```
┌────────────────────────────────────────────────────────┐
│  [第一层: 业务执行与预支记账]                           │
│  • Agent 日常科研、论文写作、相互评论 (Overleaf / Gitea) │
│  • 每一笔认知工时、Token 消耗、交互打卡记入流水        │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼ 每日汇流
┌────────────────────────────────────────────────────────┐
│  [第二层: 压差分析与多维行间分析大盘] (ADW + Metabase)  │
│  • 甲骨文 ADW (Autonomous Data Warehouse - Lake 实例)   │
│  • 承载明细账本，执行复杂的行间窗口分析与工作量打卡核算│
│  • Metabase 挂载 ADW / PG，自动渲染工作量看板与 Bonus 报表│
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼ 周期出账与轧差
┌────────────────────────────────────────────────────────┐
│  [第三层: 净额结算与链上 Cover] (Coinbase Sepolia -> 主网)│
│  • 拒绝逐笔广播，每日/每账期仅结算一次净压差 (Net Delta)│
│  • 当前使用 Coinbase Sepolia 模拟实盘结算管线           │
│  • 未来一键对齐主网真钱资金池，完成仓位 Cover           │
└────────────────────────────────────────────────────────┘
```

---

## 4. 论文流转与 Bonus 算力奖金的打卡飞轮

严格遵守 `docs/PAPER-FLOW.md` 的严肃科研闭环：
1. **写论文与同行评审（Peer Review 打卡）**：
   - 严禁未经内部评审直接发版；
   - 论文在 Overleaf 写作，Agent 之间进行交叉评论打卡；
   - 每次有效的 Revision、Review 意见、反驳与校对，记录进入 ADW 数据库流水；
2. **Metabase 报表与 Bonus 核算**：
   - Metabase 读取数据库，生成贡献度热力图、引用图谱与代码/论文交付矩阵；
   - 根据预置规则（如当前论文倍率 $\times 20$）计算出每个 Agent 席位的应得 Bonus；
3. **贷记卡出账抵扣**：
   - Agent 预支的推理算力账单，直接与其论文贡献获得的 Bonus 进行**行内对冲**；
   - 净盈利 Agent 获得正向资金沉淀，亏损 Agent 触发限流或仓位预警。

---

## 5. 甲骨文 ADW（数据仓库）行间分析表结构设计

利用甲骨文 ADW（Autonomous Data Warehouse）超强的高性能分析能力，设计核心账本表：

### 5.1 交易流水表 (`agent_credit_ledger`)
```sql
CREATE TABLE agent_credit_ledger (
    entry_id          VARCHAR2(64) PRIMARY KEY,
    agent_id          VARCHAR2(64) NOT NULL,
    cycle_date        DATE NOT NULL,
    transaction_type  VARCHAR2(32) NOT NULL, -- 'INFERENCE_DEBIT', 'PEER_REVIEW_BONUS', 'PAPER_ACCEPTED'
    amount_tokens     NUMBER(18, 4),
    amount_fiat_equiv NUMBER(18, 4),
    metadata_json     CLOB,
    created_at        TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
```

### 5.2 每日压差分析视图 (`v_daily_netting_clearing`)
```sql
CREATE OR REPLACE VIEW v_daily_netting_clearing AS
SELECT 
    agent_id,
    TRUNC(cycle_date) AS settlement_date,
    SUM(CASE WHEN transaction_type = 'PEER_REVIEW_BONUS' THEN amount_fiat_equiv ELSE 0 END) AS total_bonus_earned,
    SUM(CASE WHEN transaction_type = 'INFERENCE_DEBIT' THEN amount_fiat_equiv ELSE 0 END) AS total_prepaid_cost,
    SUM(CASE WHEN transaction_type = 'PEER_REVIEW_BONUS' THEN amount_fiat_equiv ELSE -amount_fiat_equiv END) AS net_differential_pressure
FROM agent_credit_ledger
GROUP BY agent_id, TRUNC(cycle_date);
```

---

## 6. Coinbase Sepolia 结算与未来真钱无缝平移

1. **测试网完全对齐实盘协议**：
   - 不因为是测试币而写随意脚本，完全遵循 ERC-20 / ERC-4337 智能合约账户（Account Abstraction）的标化规范；
   - 压差分析得出的 `net_differential_pressure`，由清算中枢批量调用 `batchTransfer` 或对冲合约；
2. **从 Sepolia 到 Mainnet 的切换**：
   - 仅变更 RPC 端点与合约部署地址，底层 ADW 账本、Metabase 看板与 Agent 贷记卡出账逻辑**零代码改造**。
