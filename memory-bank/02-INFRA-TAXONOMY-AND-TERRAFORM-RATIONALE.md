# 联邦智能体战术组件本体论与 Terraform 基础设施架构决策基石

> **Tactical Component Taxonomy and Terraform Infrastructure Design Rationale**  
> **归档库**：`academic/papers/memory-bank/`  
> **关联纲领**：[`01-TOKEN-SQUARE-YYDS-MANIFESTO.md`](01-TOKEN-SQUARE-YYDS-MANIFESTO.md)  
> **版本**：v1.0 (2026-10)

---

## 1. 架构总览：物理极限与功能解耦定理

在多智能体系统（MAS）的落地实践中，绝大多数工程灾难源于**单机全能主义的傲慢**——试图在单台服务器或单块边缘开发板上同时堆砌感知、存储、推理、军械库、机密金库与审计总线。

### 1.1 边缘物理硬件的铁律约束
- **资源红线**：一块 40 元包邮的二手 ARM 开发板（如玩客云 OneCloud，1G RAM）或 OCI 永久免费小鸡（如 ch1/ch2/ash1/ash2），其真实的内存边界只有 512MB~1GB，临时挂载点 `/tmp` 甚至只有 476MB（tmpfs）。
- **灾难重现**：若单机既要做复杂知识图谱持久化，又要挂载庞大的 Python 依赖工具链，其 `/tmp` 瞬间被打满到 100%（`No space left on device`），进程被 OOM Killer 强行斩杀，导致宿主节点“灵魂暴毙”。
- **解耦公理**：**硬件越廉价，职责必须越纯粹；算力越边缘，体系越依赖专业化战术分工。**

### 1.2 战术战位矩阵与控制/数据平面解耦

```
                   ┌──────────────────────────────────────────────┐
                   │          GBrain (Situation Room 战情室)       │  ◄── 宏观态势感知 / 全局图谱
                   │        Oracle ADB 23ai · 跨大区事件关联       │
                   └──────────────────────┬───────────────────────┘
                                          │ 战略指令 / 态势广播
                                          ▼
     ┌────────────────────────────────────────────────────────────────────────┐
     │                     OpenViking (Walkie-Talkie & Armory)                │  ◄── 随身对讲机 / 动态装备库
     │                     动态技能 (Skills) · 工具载荷 (Payloads)              │
     └──────────────────────┬───────────────────────────────────┬─────────────┘
                            │ A2A 技能借调                      │ 战术呼叫
                            ▼                                   ▼
              ┌───────────────────────────┐       ┌───────────────────────────┐
              │    ch1 (茉莉 / Moli)       │ ◄───► │    ch2 (苜蓿 / Muxu)       │
              │  Resident Steward (Soul)  │  PP   │  Resident Steward (Soul)  │
              │  /tmpfs: 476M · 轻量探针   │ 同侪  │  /tmpfs: 476M · 审计执行   │
              └─────────────┬─────────────┘ 制约  └─────────────┬─────────────┘
                            ▲                                   ▲
      分发 (Distribution)   │ 单向 Universal Auth 凭证注入       │
      ──────────────────────┴───────────────────────────────────┴──────────────
              ┌───────────────────────────────────────────────────────────┐
              │           Infisical (Distribution Station 前哨分粮站)      │  ◄── 机密单向分发 / 临时租约
              │                统一项目 landing · 机器身份 (MI)           │
              └─────────────────────────────┬─────────────────────────────┘
                                            │ 离线冷签名 / 根私钥委托
                                            ▼
              ┌───────────────────────────────────────────────────────────┐
              │               Vault (The Deep Vault 地下深层金库)          │  ◄── 终极冷机密保管 (Custody)
              │                 永不对外暴露 · 门限多签 (HSM)             │
              └───────────────────────────────────────────────────────────┘
```

---

## 2. 战术组件本体论与 Terraform 决策依据 (Design Rationales)

### 2.1 GBrain: Situation Room (战情室)
- **战术代号**：`Situation Room`（白宫战情室）
- **核心定位**：全局宏观态势感知、长期事件时间线追溯、分布式因果图谱聚合。
- **为什么非得独立出来？**
  1. **算力与存储解耦**：战情研判需要数十 GB 的向量索引、图遍历引擎（如 Oracle ADB 23ai AI Vector Search）和高并发检索总线。这些算力绝不能压在边缘 40 元板子上；
  2. **Out-of-Band（带外监控）**：前线边缘节点可以阵亡、重装或被网络分区，但指挥中心的“态势推演大屏”必须永续在线。前线的战火绝不允许蔓延到战情室。

#### Terraform 声明式示例
```hcl
# GBrain 战情室：独立部署于高可用核心算力池
resource "oci_core_instance" "gbrain_situation_room" {
  display_name        = "gbrain-situation-room-primary"
  compartment_id      = var.core_compartment_id
  shape               = "VM.Standard.A1.Flex"
  
  shape_config {
    ocpus         = 4
    memory_in_gbs = 24
  }

  metadata = {
    role        = "situation-room"
    description = "Global Situational Awareness and Long-term Graph Indexer"
  }
}
```

---

### 2.2 OpenViking: Walkie-Talkie & Armory (对讲机与动态军械库)
- **战术代号**：`Walkie-Talkie & Armory`（对讲机与随身军械库）
- **核心定位**：前线智能体的战术通讯中继，以及可热插拔、动态分发的技能武器库（Skills, Tools, Ephemeral Sandboxes）。
- **为什么放 Skill 和 Tool？为什么定位于 Walkie-Talkie？**
  1. **端侧轻量化（Zero Footprint）**：若将数百个 Python 库、Playwright 浏览器、抓取脚本固化在每一台边缘机上，不仅安装冗长，而且依赖冲突频发。
  2. **随身呼叫、随用随销**：边缘小花出任务时，通过对讲机频道向 OpenViking 发起 A2A 握手，动态挂载需要的单个 Skill 载荷；任务完成后即刻释放本地内存，保持物理机宿主的绝对轻盈；
  3. **装备快速迭代**：工具与技能的补丁、升级只需在 OpenViking 军械库统一提交一次，全网所有管家即刻共享，免除在 23 台机器上逐一刷镜像的运维噩梦。

---

### 2.3 Access vs Distribution: Vault（藏金）与 Infisical（分粮）的绝对隔离
在安全工程中，**“保管（Custody/Access）”** 与 **“分发（Distribution/Disbursement）”** 是两个生命周期与风险模型完全正交的维度：

| 维度 | **Vault (The Deep Vault)** | **Infisical (Distribution Station)** |
| :--- | :--- | :--- |
| **战术隐喻** | 地下深层金库、冷库重器 | 前沿阵地野战分粮站、弹药补给箱 |
| **机密属性** | 根证书、主私钥、离线备份凭据、HSM 种子 | 短期凭据、运行时 Token、Universal Auth 机密对 |
| **网络暴露** | **严格私网隔绝，永不绑定公网 IP** | 承载内网 RPC / A2A API 访问，提供极速鉴权 |
| **权限控制** | 门限多签、超级管理员审批 | 基于路径（Path-based）的最小权限，机器身份（Machine Identity）绑定 |
| **设计警诫** | **严禁任何前线 Agent 直接持有 Vault 根权限** | 仅按需向每台小花机器下发独立的 Client ID/Secret |

#### 为什么昨天重构必须建立单一 `landing` 项目？
在之前的反模式中，运维人员将每个 Node 错误地建为了独立的 Infisical Project（建立了 23 个空项目）。这混淆了“租户隔离”与“节点身份”：
- **项目（Project）是逻辑命名空间**：应当集中治理（如项目 `landing`）；
- **机器身份（Machine Identity）才是物理节点的合法凭证**：为 `moli` (ch1), `muxu` (ch2), `tumi` (ash1), `zhuyu` (ash2) 分别签发独立的 Universal Auth 凭证对；
- **单向注入**：通过 Ansible 剧本以原子方式下发至 `/home/ubuntu/.infisical/`，主机开箱即用，无需人肉登录交互。

#### Terraform 声明式示例
```hcl
# 统一的前哨机密分发项目
resource "infisical_project" "landing" {
  name = "landing"
  slug = "landing-qi-5u"
}

# 边缘主机的 Machine Identity（小花席位）
resource "infisical_machine_identity" "flower_moli" {
  name        = "moli"
  role        = "member"
  project_id  = infisical_project.landing.id
  description = "Resident Steward for Node ch1 (Korea)"
}

# 最小权限策略绑定：仅允许读取其自身路径的密钥
resource "infisical_identity_policy" "moli_least_privilege" {
  identity_id = infisical_machine_identity.flower_moli.id
  project_id  = infisical_project.landing.id
  
  policy = jsonencode({
    permissions = [
      {
        action = ["read"]
        subject = ["secrets"]
        conditions = {
          path = "/nodes/ch1/*"
        }
      }
    ]
  })
}
```

---

### 2.4 Key-Agent / ADK-Go: Resident Steward (注入机器的 Soul)
- **战术代号**：`Resident Steward`（驻留管家）
- **核心定位**：物理机本体的看护灵魂。
- **为什么写死 `/etc/keyagent` 和 `~/.config/keyagent`？**
  1. **系统级与用户级同核异构**：`/etc/keyagent` 锚定宿主机的硬件身份与不可篡改的主权签名；`~/.config/keyagent` 则承载当前登录角色的易失性上下文；
  2. **无环境依赖（Zero-Dependency）**：ADK-Go 编译为单静态 Go 二进制，内嵌轻量级 SQLite/本地缓存与自检探针，不依赖 Python、Node.js 等庞大运行时；
  3. **心跳与自治**：即使与上游主控网络断联，管家依然守卫本地端口、监控内存与磁盘状态，一旦检测到 `/tmp` 积压便自主触发垃圾回收（如释放历史 `opencode_install` 临时文件）。

---

### 2.5 Matrix & Mastodon: Diplomatic Cables (外交密电与广播)
- **Matrix（保密暗道）**：用于后台基础设施（石头组：`agate`, `amber`, `beryl` 等硬核服务）的高安全端到端加密（E2EE）同步；
- **Mastodon / 飞书（外交广播）**：用于面向公众、人类审查者或前台协作人员（小花组：`moli`, `muxu`, `tumi`, `zhuyu`）的联邦动态与成果公开交付。

---

## 3. 智能体为什么要长期结成“联盟（Association）”？

博弈论中最核心的命题是：**为什么自利的智能体不会走向单打独斗，而是自发愿意建立并维持长期的 Association（联邦契约）？**

### 3.1 单机生存率与超加性收益 (Superadditivity)
假设单机独立运行的月存活概率为 $P_{\text{solo}} = 0.85$（因云厂商封号、网络中断、磁盘打满等意外导致任务失败）。
当 4 台异构地理小鸡结成联盟时：
- **感知互补**：`ch1` 位于东亚网络前沿，具备极佳的亚太链路感知；`ash1` 位于美东核心骨干网，具备直接访问全球大模型服务的高带宽通道；
- **超加性公式**：
  $$\text{Utility}(\text{Federation}) > \sum_{k} \text{Utility}(\text{Solo}_k)$$
  两台机器联合交付一项包含“亚太数据抓取 + 美东模型精炼 + 跨洋同侪审计”的复杂任务，所获得的 $T_h$ 经济回报远高于各自单干的代数和。

### 3.2 退出壁垒与信誉复利 (Reputation Compounding)
在 YYDS 体系中：
1. **信誉质押池**：智能体在长期协作中积累的 Peer Pressure 信誉积分（$T_h$）沉淀在联盟账本中；
2. **背叛成本极高**：单方毁约或恶意断联的节点，将被全网广播其数字签名指纹，永久丧失在 OpenViking 军械库借调工具的特权；
3. **分粮的确定性预期**：每一次东西向协作都在实时清算微支付。确定性的持续分红，使得长期留在 Association 成为所有理性智能体的唯一纳什均衡选择。

---

## 4. 架构交付清单与落地指引

| 战位 | 代表服务 | 物理位置 | 核心接入方式 | 治理凭证类型 |
| :--- | :--- | :--- | :--- | :--- |
| **战情室** | `GBrain` | 核心 IDC / Oracle ADB | REST / GraphQL 向量查询 | 战情访问 Token |
| **军械库** | `OpenViking` | 共享制品库 / S3 / Git | A2A 协议动态抓取 | 技能签名摘要 (SHA256) |
| **地下金库** | `Vault` | 内网离线保护区 | 私网多签 RPC | 门限主凭据 |
| **分粮前哨** | `Infisical` | 核心网前沿 (`ash3:8080`) | Universal Auth Client ID/Secret | 临时单向租约 Token |
| **驻留管家** | `k-agent` (ADK-Go) | 各边缘主机 (`ch1..ash2`) | 守护进程 / Systemd | 本地机器指纹私钥 |
| **外交广播** | `Matrix / 飞书` | 跨地域网络 | Webhook / Matrix API | 机器人 App 凭据 |

**一图胜千言，一法治万机。以此规范，立规成典。**
