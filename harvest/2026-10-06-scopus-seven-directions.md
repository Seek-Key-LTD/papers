# Scopus 收割快报 · 论文七向（2026-10-06）

> 通道：luban 已登录 Scopus(EZproxy/ASU) 页内 replay `/api/documents/search` API（试用窗口第 4 天）。
> 方法：每方向 TITLE-ABS-KEY 查询，取前 20 条（服务端固定按日期序，**非引用序**；快报内已按被引本地重排）。
> 已知限制：deep-link `qs=` 参数被 SPA 忽略；API `sort` 字段被忽略；P2/P4/P6 查询 OR 展开过宽导致噪声，下一轮收紧。

## P1-MoE平方-异构大模型联邦调度

- 命中总量: **30**
- 查询: `TITLE-ABS-KEY ( ( "mixture of experts" AND ( routing OR scheduling OR load balancing ) AND ( "large language model" OR LLM ) ) ) AND PUBYEAR > 2022`

| 被引 | 年 | 标题 | 来源 | DOI |
|---:|---|:---|:---|:---|
| 13 | 2026 | A Survey on Inference Optimization Techniques for Mixture of Experts Models | ACM Computing Surveys | 10.1145/3794845 |
| 9 | 2025 | MoE-LPR: Multilingual Extension of Large Language Models through Mixture-of-Experts with Langua | Proceedings of the Aaai Conference on Artific | 10.1609/aaai.v39i24.34805 |
| 8 | 2026 | MoE2: Optimizing Collaborative Inference for Edge Large Language Models | IEEE Transactions on Networking | 10.1109/TON.2026.3677371 |
| 2 | 2025 | Towards Building Private LLMs: Exploring Multi-Node Expert Parallelism on Apple Silicon for Mix | 2024 Research in Adaptive and Convergent Syst | 10.1145/3649601.3698722 |
| 1 | 2026 | A Survey on Accelerated Technologies for Mixture-of-Experts Model Training Systems | Tsinghua Science and Technology | 10.26599/TST.2025.9010169 |
| 1 | 2025 | Balanced and Elastic End-to-end Training of Dynamic LLMs | Proceedings of the International Conference f | 10.1145/3712285.3759775 |
| 1 | 2025 | DeepSeek model analysis and its applications in AI-assistant protein engineering | Synthetic Biology Journal | 10.12211/2096-8280.2025-041 |
| 0 | 2026 | PHASE-MoE: Physics-guided hierarchical adaptive mixture of spectral experts for LLM-based lithi | Expert Systems with Applications | 10.1016/j.eswa.2026.133425 |
| 0 | 2026 | Balancing and Beyond: Communication-Centric Optimizations in Expert Parallelism | SIGCOMM 2026 Proceedings of the 2026 ACM SIGC | 10.1145/3789240.3829201 |
| 0 | 2026 | Connecting 100K+ GPUs: Building the Communication Stack for Large-Scale LLM Training | SIGCOMM 2026 Proceedings of the 2026 ACM SIGC | 10.1145/3789240.3829152 |

## P2-认知主权-Agent身份与KYA

- 命中总量: **1191**
- 查询: `TITLE-ABS-KEY ( ( ( "agent identity" OR "know your customer" OR KYC OR onboarding ) AND ( "AI agent" OR "large language model" ) ) OR ( ( geopolitical OR fragmentation ) AND ( "AI infrastructure" OR cloud ) ) ) AND PUBYEAR > 2023`

| 被引 | 年 | 标题 | 来源 | DOI |
|---:|---|:---|:---|:---|
| 1 | 2026 | Semantic segmentation of Buddha facial point clouds through knowledge-guided region growing | Npj Heritage Science | 10.1038/s40494-026-02377-y |
| 1 | 2026 | Enhancing patient admission efficiency through a hybrid cloud framework for medical record shar | Scientific Reports | 10.1038/s41598-026-35014-6 |
| 1 | 2026 | Impact of atmospheric electrical charges on ryegrass pollen rupture and sub-pollen particle rel | Scientific Reports | 10.1038/s41598-026-54231-7 |
| 0 | 2027 | Unified Namespace (UNS) Architecture for High-Throughput Factory Data Ingestion and Analytics | Journal of Pharmaceutical Innovation | 10.1007/s12247-026-10998-w |
| 0 | 2027 | Time-to-aging-failure prediction of software systems via multi-scale spatio-temporal graph lear | Journal of Systems and Software | 10.1016/j.jss.2026.113070 |
| 0 | 2027 | Stage-resolved evolution and size-dependent vertical transport of bubble clouds beneath plungin | Coastal Engineering | 10.1016/j.coastaleng.2026.105147 |
| 0 | 2027 | Orchestrating AI Microservices for Adaptive Fraud Detection and Compliance in Modern Financial  | Lecture Notes in Networks and Systems | 10.1007/978-3-032-32476-4_46 |
| 0 | 2027 | Fragmentation of a projectile and composite overwrapped pressure vessel front wall by hypervelo | Thin Walled Structures | 10.1016/j.tws.2026.115680 |
| 0 | 2027 | What Do AI Agents Actually Change? An Empirical Taxonomy of Mutation Patterns in Performance-Im | Lecture Notes in Computer Science | 10.1007/978-3-032-30699-9_12 |
| 0 | 2027 | Dynamic Resource Management in Cloud Computing: Energy-Efficient Using P-ERBU with ARIMA-SVR | Lecture Notes in Networks and Systems | 10.1007/978-3-032-34772-5_9 |

## P3-认知场-GraphRAG与多Agent上下文路由

- 命中总量: **1179**
- 查询: `TITLE-ABS-KEY ( ( ( graphrag OR "graph retrieval-augmented generation" OR "retrieval-augmented generation" ) AND ( "multi-agent" OR "context routing" OR orchestration ) ) ) AND PUBYEAR > 2023`

| 被引 | 年 | 标题 | 来源 | DOI |
|---:|---|:---|:---|:---|
| 0 | 2027 | LLM-driven paradigm for agent-based modeling and simulation: A review and organizing framework | Computer Science Review | 10.1016/j.cosrev.2026.101054 |
| 0 | 2027 | An agentic multimodal RAG framework for enhancing nuclear regulatory review: Preserving structu | Nuclear Engineering and Technology | 10.1016/j.net.2026.104687 |
| 0 | 2027 | RAG2: Reinforcement Learning and Multi-agent Synergy for Graph-Enhanced Retrieval-Augmented Gen | Lecture Notes in Computer Science | 10.1007/978-981-92-3417-2_33 |
| 0 | 2027 | ID-GraphRAG: An Incremental Construction Framework of Document-Level Retrieval-Augmented Knowle | Lecture Notes in Computer Science | 10.1007/978-981-92-2856-0_11 |
| 0 | 2027 | QAlign-RAG: Causal-Aware Pseudo-Question Generation and Debate-Driven Verification for Medical  | Lecture Notes in Computer Science | 10.1007/978-981-92-2852-2_13 |
| 0 | 2027 | MatGraphRAG: Orchestrating Structured Retrieval and Multi-agent Planning for Constraint-Aware M | Lecture Notes in Computer Science | 10.1007/978-981-92-3403-5_3 |
| 0 | 2027 | AutoCode4HW: Knowledge-Graph Enhanced Multimodal LLM Agents for Generating Medical Hemodynamics | Lecture Notes in Computer Science | 10.1007/978-981-92-2864-5_33 |
| 0 | 2027 | Agent-GRAFT: Agent-Driven Dynamic Graph Repair for Multi-Hop Question Answering Over Fragmented | Lecture Notes in Computer Science | 10.1007/978-981-92-3417-2_49 |
| 0 | 2027 | ViFin-MARS: A Question-Answering System for Financial News Dataset Integrating User Intent Iden | Communications in Computer and Information Sc | 10.1007/978-981-92-2590-3_7 |
| 0 | 2027 | A Four-Layer Multi-agent Architecture for Automated Journalism: Event-Driven Orchestration with | Lecture Notes in Computer Science | 10.1007/978-981-92-2014-4_32 |

## P4-记忆经济学-Agent记忆与KV缓存成本

- 命中总量: **5076**
- 查询: `TITLE-ABS-KEY ( ( ( "agent memory" OR "memory management" OR "KV cache" ) AND ( LLM OR "large language model" ) ) OR ( ( "context window" OR token ) AND ( economics OR cost OR pricing ) ) ) AND PUBYEAR > 2023`

| 被引 | 年 | 标题 | 来源 | DOI |
|---:|---|:---|:---|:---|
| 0 | 2027 | Numerical approximation in discrete portfolio optimization using DeFi as a new asset frontier:  | Journal of Computational and Applied Mathemat | 10.1016/j.cam.2026.118178 |
| 0 | 2027 | TeD-Loc: Text distillation for weakly supervised object localization | Pattern Recognition | 10.1016/j.patcog.2026.114994 |
| 0 | 2027 | EIMa: Efficient and robust local feature matching with interleaved Mamba | Pattern Recognition | 10.1016/j.patcog.2026.114916 |
| 0 | 2027 | MIRA-KG: Multimodal knowledge graph question answering via instruction guidance and hierarchica | Information Sciences | 10.1016/j.ins.2026.124160 |
| 0 | 2027 | Cross-layer prior-guided center evolution for lightweight image super-resolution | Pattern Recognition | 10.1016/j.patcog.2026.114759 |
| 0 | 2027 | SpectVit: Spectral–spatial gating for efficient vision transformers | Pattern Recognition | 10.1016/j.patcog.2026.114749 |
| 0 | 2027 | Data-centric AI in disaster management: Scalable Named Entity Recognition via LLM-based stackin | Information Processing and Management | 10.1016/j.ipm.2026.105187 |
| 0 | 2027 | Learning to Replay: A meta-reinforcement learning approach to experience replay in continual le | Pattern Recognition | 10.1016/j.patcog.2026.114745 |
| 0 | 2027 | Learning to prefer: Reward-driven infrared-visible fusion via RWKV | Information Fusion | 10.1016/j.inffus.2026.104685 |
| 0 | 2027 | Learning to coordinate: A knowledge-distilled agent for adaptive multi-agent code generation | Expert Systems with Applications | 10.1016/j.eswa.2026.134396 |

## P5-博弈安全-Shamir门限与多签

- 命中总量: **924**
- 查询: `TITLE-ABS-KEY ( ( ( "secret sharing" OR "threshold signature" OR multisig OR Shamir ) AND ( "smart contract" OR blockchain OR custody ) ) ) AND PUBYEAR > 2021`

| 被引 | 年 | 标题 | 来源 | DOI |
|---:|---|:---|:---|:---|
| 3 | 2026 | Research on key technologies for privacy-preserving, regulatorily compliant, and cross-chain in | Scientific Reports | 10.1038/s41598-026-42543-7 |
| 1 | 2026 | CAPPR-Wallet: a context-aware and recoverable wallet architecture with privacy-preserving rules | Scientific Reports | 10.1038/s41598-026-43214-3 |
| 1 | 2026 | Privacy-preserving federated learning for multi-regional disability employment matching: a comp | Discover Artificial Intelligence | 10.1007/s44163-026-01014-8 |
| 1 | 2026 | Enhancing privacy and transparency in electronic voting: a blockchain-based cryptographic frame | Journal of Cloud Computing | 10.1186/s13677-026-00839-z |
| 0 | 2027 | A Distributed Weighted Threshold Signature with Packing for Weight-Differentiated Blockchains | Communications in Computer and Information Sc | 10.1007/978-981-92-2973-4_19 |
| 0 | 2027 | 8th CCF China Blockchain Conference, CCF CBCC 2025 | Communications in Computer and Information Sc | - |
| 0 | 2027 | Blockchain-Based Knowledge Verification and Confirmation Using Certificateless Signatures | Lecture Notes in Computer Science | 10.1007/978-981-92-2859-1_11 |
| 0 | 2027 | Practical Zero-Trust Threshold Signatures in Large-Scale Asynchronous Networks | Lecture Notes in Computer Science | 10.1007/978-3-032-32560-0_17 |
| 0 | 2027 | ParaShard: A Fast Path Parallel Execution Approach for Accelerating Cross-Shard Transactions | Lecture Notes of the Institute for Computer S | 10.1007/978-3-032-32764-2_17 |
| 0 | 2026 | Blockchain-assisted cross-domain batch authentication and key agreement scheme for IIoT | Journal of Systems Architecture | 10.1016/j.sysarc.2026.103986 |

## P6-事态感知-前摄式上下文预测注入

- 命中总量: **1710**
- 查询: `TITLE-ABS-KEY ( ( ( "situation awareness" OR proactive OR anticipatory OR predictive ) AND ( "context injection" OR "context retrieval" OR "language model" OR assistant ) AND ( memory OR context ) ) ) AND PUBYEAR > 2023`

| 被引 | 年 | 标题 | 来源 | DOI |
|---:|---|:---|:---|:---|
| 0 | 2027 | Digital and AI-enabled support for HACCP-based dairy food safety management: Functions, evidenc | Food Control | 10.1016/j.foodcont.2026.112642 |
| 0 | 2027 | Towards reliable LLM evaluators: Discovering and internalizing explicit scoring logic | Information Processing and Management | 10.1016/j.ipm.2026.105154 |
| 0 | 2027 | Leveraging large language models for agentic process analytics assistants: Assessing accuracy i | Expert Systems with Applications | 10.1016/j.eswa.2026.133347 |
| 0 | 2027 | Do as You See, Not Just as Told: Multimodal Fusion for Proactive Decision-Making in Dynamic Env | Lecture Notes in Computer Science | 10.1007/978-981-92-3441-7_12 |
| 0 | 2027 | A Practical Evaluation Methodology for Generative AI in Maintenance Applications: Accuracy and  | Lecture Notes in Computer Science | 10.1007/978-3-032-32643-0_15 |
| 0 | 2027 | 14th World Conference on Information Systems and Technologies, WorldCIST 2026 | Lecture Notes in Networks and Systems | - |
| 0 | 2027 | A Large Language Model Framework for Predicting Judicial Outcomes in Civil Law Systems | Lecture Notes in Computer Science | 10.1007/978-3-032-31335-5_46 |
| 0 | 2027 | Tokenization in Protein Language Models: Methods, Taxonomy, and Applications | Communications in Computer and Information Sc | 10.1007/978-981-92-2597-2_11 |
| 0 | 2027 | Utilizing Large Language Models for Machine Learning Explainability | Communications in Computer and Information Sc | 10.1007/978-3-032-36547-7_39 |
| 0 | 2027 | CHORD: Context Homogeneity Analysis for Robust Defense Against RAG Poisoning Attacks | Communications in Computer and Information Sc | 10.1007/978-981-92-3541-4_6 |

## P7-灵魂迁移-Agent身份与记忆可移植

- 命中总量: **106**
- 查询: `TITLE-ABS-KEY ( ( ( "LLM agent" OR "language model agent" ) AND ( portability OR migrat* OR checkpoint OR "identity persistence" OR "persona" OR "state transfer" ) ) ) AND PUBYEAR > 2023`

| 被引 | 年 | 标题 | 来源 | DOI |
|---:|---|:---|:---|:---|
| 1 | 2026 | LLM-Driven Generative Agents for Simulating Occupant Feedback in Built Environments | Journal of Computing in Civil Engineering | 10.1061/JCCEE5.CPENG-7365 |
| 0 | 2027 | The Pragmatic Persona: Discovering LLM Persona Through Bridging Inference | Lecture Notes in Computer Science | 10.1007/978-3-032-31438-3_6 |
| 0 | 2027 | Securing LLM Agents in Production: Threat Models, Defenses, and Operational Trade-Offs | Communications in Computer and Information Sc | 10.1007/978-3-032-29251-3_6 |
| 0 | 2027 | 22nd International Conference on Intelligent Computing, ICIC 2026 | Lecture Notes in Computer Science | - |
| 0 | 2026 | Persona-prompted LLM agents achieve modest but genuine prediction of human social media reactio | Scientific Reports | 10.1038/s41598-026-66277-8 |
| 0 | 2026 | End-to-End Clinical Validation of a Human-Supervised Large Language Model Agent for Enterprise  | Modern Pathology | 10.1016/j.modpat.2026.101049 |
| 0 | 2026 | Aligning LLM agents with human learning and adjustment behavior: A dual agent approach | Transportation Research Part C Emerging Techn | 10.1016/j.trc.2026.105818 |
| 0 | 2026 | FreshBrew: A Benchmark for Evaluating AI Agents on Java Code Migration | Proceedings 2026 IEEE ACM 48th International  | 10.1145/3744916.3773214 |
| 0 | 2026 | Can LLMs Simulate Economic Agents? Testing Production Theory with GPT-Based Firm Behavior | Proceedings of 2026 5th International Confere | 10.1145/3819836.3819966 |
| 0 | 2026 | OOPS: Automated generation of REST API specification via LLMs | Journal of Systems and Software | 10.1016/j.jss.2026.112914 |
