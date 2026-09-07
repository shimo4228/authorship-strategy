<!-- origin: shimo4228 -->
# Repository maintenance

編集・記録・公開作業の該当箇所で参照する規約。探索の手順は定めない。
構成と文書の正本は [CODEMAP](CODEMAPS/architecture.md)、背景と関連プロジェクトは
[README](../README.md)、component skill の所在は [skill index](skills/README.md) を参照。

## 執筆と翻訳

- 英語が正本。README、thesis、glossary、ADR は日本語 subordinate と対で更新する。
  manifesto、inspiration、empirical 層は英語のみ。
- ADR の必須節は Status / Date / Context / Decision / Alternatives Considered /
  Consequences。末尾に Lineage を置く。実験的な判断は Status に **experimental** と記す。
- ADR の判断・理由・代替案は harness / vendor / framework neutral に書く。
  具体的な製品名や標準名は一般語へ抽象化し、実装情報は `docs/skills/` の参照先などで扱う。
- thesis / ADR / manifesto / glossary は判断を扱う normative 層、`docs/empirical/` は
  観測を扱う empirical 層。観測には “preliminary observation” または “consistent with” を使う。
  観測が原則の改訂を促す場合は、対応 ADR を改訂する。
- `attribution` は本 repo では出典への credit、AAP では行為への accountability を意味する。
  `sibling` は研究ライン、`component` は doctrine が名指しする skill に使う。
  詳細は [glossary](glossary.md) と [skill index](skills/README.md)。

## 観測資料を更新するとき

方法と各 baseline の時間範囲は [empirical README](empirical/README.md) が正本。
データは hub の `traffic/data/*.jsonl` にある日次 snapshot を使用する。
著者一人の case study、導入前後比較の不在、bot/crawler と人間の分離の難しさ、
単発のモデル検証という制限を、該当する観測に明示する。異なる期間や母集団を混ぜない。

## 実施を記録するとき

- Private implementation ledger: project memory の `diffusion-channel-status.md`。
  実施状況、採用候補、運用詳細を持つ作業台帳。
- Public projection: [implementation log](empirical/implementation-log.md)。
  日付付き介入だけを英語で記録し、効果を主張しない。host や私的な運用情報は ADR-0012 の水準に抽象化する。
- 介入を実施したら ledger を先に更新し、その後 public projection に日付行を追加する。
  実施状況の確認や重複確認には台帳を使う。会話で生まれた案や問いの保存先は、記録の依頼に合わせて決める。

役割分担の根拠は [ADR-0014](adr/0014-implementation-tracking-two-tier-ledger.md)。

## ADR・概念・graph を編集するとき

- ADR の起草・改訂、glossary / graph 更新、release 前には research wiki の対応 concept を
  read-only で参照する。場所は
  `~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian Vault/wiki/concept/`。
  主担当は `authorship-strategy.md`、必要に応じて GEO / オーセンティシティ / AKC / LLM を参照する。
- wiki は問い・矛盾・出典候補を探す補助資料。公開する主張は一次出典まで遡って確認し、
  wiki ページや vault のパスを出典として引用しない。
- `graph.jsonld` は概念と関係、CODEMAP はファイルと役割を記述する。
  新規 ADR / Concept の追加では両方を更新する。既存項目の改訂では対応する説明をそろえる。
- 本 repo の graph は doctrine concept と component skill が対象。
  `doctrine-corpus` は hub の data-sibling 登録、`existence-proof` は hub の pre-line complement
  登録が正本。本 repo に node がないことを不足と扱わない。
- 新規 ADR / Concept、大規模 thesis 改訂で hub への反映が必要なときは、hub の指示を参照する。
  参照には concept DOI を使い、hub に volatile な運用状態を持ち込まない。
- 構造や説明の変更は関連する AI 向け説明にも反映し、`bash scripts/verify-counts.sh` で
  ADR・open question の件数を確認する。

## 共通スキルと公開

共通スキルは `~/.claude/skills/` の正本を編集する。`~/.agents/skills` 経由で共有される。
この repo の `docs/skills/` は参照 index であり、skill 本文のコピーを置かない。
公開 copy への同期は `harness-sync`、DOI release は `release-doi` の手順を使う。

## Dataset mirror を公開するとき

graph の公開更新時は `hf-sync` を参照する。dataset card は独自内容を持つので、
graph と一緒に上書きしない。GitHub owner は `shimo4228`、dataset owner は `Shimo4228`。

| Repo | Dataset |
|---|---|
| authorship-strategy | Shimo4228/authorship-strategy |
| agent-knowledge-cycle | Shimo4228/agent-knowledge-cycle |
| contemplative-agent | Shimo4228/contemplative-agent |
| agent-attribution-practice | Shimo4228/agent-attribution-practice |
| attention-not-self | Shimo4228/attention-not-self |
| shimo4228 (hub) | Shimo4228/research-program-hub |
