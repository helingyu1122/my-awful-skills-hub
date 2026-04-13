# 安装说明

## 目的

这是一个仓库维护型 skill。它的职责是编排仓库脚本，而不是要求团队成员手工创建目录和文件。

## 仓库约定

- 新建 skill 时优先调用 `./scripts/create-skill`
- 平时主要编辑 `core/` 和 `skill.yaml`
- 不要把生成后的 adapters 当作主源
- 改完后执行 `./scripts/build <skill-id>`
- 标记 ready 前执行 `./scripts/doctor <skill-id>`

## 团队推荐顺序

1. `./scripts/create-skill <skill-id> <display-name> <summary>`
2. 用这个 meta skill 替换 starter 里的 TODO 内容
3. 必要时检查并调整 `catalog.yaml`
4. `./scripts/build <skill-id>`
5. `./scripts/doctor <skill-id>`
