<!-- origin: shimo4228 -->
# authorship-strategy

AI 時代に、作り手の考えがどう使われ、出典とともに伝わるかを探るプロジェクト。
現在の戦略と判断、その実施から得た観測を公開している。

## 会話と探索

ユーザーが今考えたいことから始める。既存の thesis・ADR・戦術は検討材料であり、
それらの前提を問い直す案も扱う。壁打ちでは、会話に必要な資料を必要な範囲で参照する。
具体案の評価を求められたら、その案に関係する根拠と制約を調べる。
記録や実装は、その作業が依頼されたときに行う。

## 資料の入口

- [README](README.md) / [日本語](README.ja.md): プロジェクトの概要
- [thesis](docs/thesis.md) / [日本語](docs/thesis.ja.md): 現在の中心的な主張
- [manifesto](docs/manifesto.md): これまでに開いた問い
- [CODEMAP](docs/CODEMAPS/architecture.md): 各資料の所在

## 編集するとき

変更対象が決まったら、[保守規約](docs/maintenance.md)の該当節を参照する。
この repo は doctrine と観測の正本。共通スキルの正本は `~/.claude/skills/`、
wiki は参照専用で、その編集は vault セッションで扱う。
`AGENTS.md` と `CLAUDE.md` は同じ内容に保つ。
