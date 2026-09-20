# 论文互操作与发布流程

本仓库采用 **Gitea 主仓库 → GitHub 镜像 → Zenodo DOI 归档** 的两阶段流程。

## 1. 正典与职责

| 系统 | 职责 | 是否产生 DOI |
| --- | --- | --- |
| Overleaf | 写作、协作、逐稿 review、编译预览 | 否 |
| Gitea `seekkey/papers` | 主版本源、贡献身份、revision 证据 | 否 |
| GitHub `Seek-Key-LTD/papers` | 公开镜像、CI 编译、Release 入口 | 否 |
| Zenodo | 人工批准版本的永久归档和 DOI | 是 |

MongoDB Atlas 只是自建 Overleaf 的后端数据库，不参与论文同步、review 或 DOI 发布。

## 2. 什么时候同步到 GitHub

当前 Gitea Actions 工作流 `.gitea/workflows/sync-to-github.yml` 的触发条件是：

- **push 到 Gitea `main` 分支**：同步 `main` 分支到 GitHub；
- **push 任意 Git tag**：同步该 tag 到 GitHub；
- **手动 `workflow_dispatch`**：按需补做一次同步。

这里的“提交触发”准确说是 **push 触发**，不是本地 `git commit` 触发：

```text
git commit                 不触发
git push origin feature/*  不触发
git push origin main       触发 GitHub 镜像
git push origin v1.0.0     触发 GitHub 镜像（含 tag）
```

因此，论文应先在 feature branch 或 Overleaf 完成修改和人工检查，再合并/推送到 Gitea `main`。推送到 `main` 后，Gitea Runner 才把同一个 commit SHA 镜像到 GitHub。

## 3. GitHub CI 与 Zenodo 的边界

- GitHub 收到 `main` 更新后，可以自动编译和上传 CI artifact；
- 普通 `main` 同步 **不会产生 DOI**；
- 只有人工 review 通过、创建正式版本 tag（例如 `v1.2.0`）并发布 GitHub Release 后，才允许进入 Zenodo 归档；
- Zenodo 的 DOI 对应一个不可变的正式版本，而不是每个普通 commit。

## 4. Revision 与 bonus

每个经过人工验收的 revision 都应记录：

- `paper_id`、`revision_id`、完整 commit SHA；
- account ID、执行 host、作者/贡献者；
- 编译结果、变更摘要、reviewer 和验收时间；
- bonus 结算状态与论文倍率（当前为 ×20）；
- 如已发布，再记录 Zenodo DOI。

普通保存、临时 commit、失败编译和未验收的 push 不得自动结算 bonus。Zenodo DOI 是发布归档证据，不替代 revision review 证据。

## 5. 操作检查清单

1. 在 Overleaf 完成修改并编译；
2. 在 feature branch 提交，执行本地/CI 检查；
3. 人工 review 通过后合并到 Gitea `main`；
4. 确认 Gitea Runner 已将相同 SHA 推送到 GitHub；
5. 需要公开归档时创建正式 tag/Release；
6. 确认 Zenodo DOI 和 revision 记录，再进入 bonus 结算。
