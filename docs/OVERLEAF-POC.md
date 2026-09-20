# Overleaf 免费互操作 PoC

当前 Community Edition 实例没有启用 Git Bridge，因此不直接写 MongoDB Atlas，也不假设存在公开 REST API。

本 PoC 验证不付费时的安全路径：

```text
Gitea papers/dev
    ↓ package-overleaf-project.sh
标准 ZIP（main.tex + .bib + figures/assets）
    ↓ Overleaf 网页 Upload Project
Overleaf 编译与人工 review
    ↓ 导出 ZIP
Gitea 提交 review 结果
```

## 生成导入包

```bash
./scripts/package-overleaf-project.sh \
  papers/01-temporal-asymmetry-and-capital-training \
  /tmp/SK-WP-2026-001-overleaf.zip
```

ZIP 根目录必须直接包含 `main.tex`。脚本会排除 PDF、LaTeX 临时文件、缓存和 `.git`，并执行 `unzip -t` 完整性检查。

## 验收标准

- ZIP 可以在 Overleaf 的 **New Project → Upload Project** 导入；
- `main.tex` 位于项目根目录并可编译；
- `.bib`、图片和自定义宏包随包携带；
- Overleaf review 完成后，导出的源文件能够回到 Gitea `dev` 形成新的 revision；
- 不读取、不写入 MongoDB Atlas 内部集合。

该 PoC 只验证文件互操作，不自动发布 GitHub 或 Zenodo。正式发布仍需人工 review、合并到 `main`，再按论文发布流程打 tag。
