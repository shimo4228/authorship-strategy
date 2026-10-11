Language: [English](0014-implementation-tracking-two-tier-ledger.md) | 日本語

# ADR-0014: 二層 ledger による実装トラッキング

> **要約.** private な implementation ledger は運用状況と作業詳細を持つ。
> public な intervention timeline は、その日付付き・効果主張なしの投影を記録する。
> トラッキングは実施を支える。発想の方法や、問い直してよい戦略の前提は指定しない。

## Status

accepted — amended 2026-09-07; 計画とタスクの状態の source of truth としての private ledger と Decision 1 の更新順は [ADR-0025](0025-planning-and-task-state-in-a-public-rfc-store.ja.md) が supersede (2026-10-12)

## Date

2026-06-13; amended 2026-09-07

## Amendment — 2026-09-07

二層 ledger と ledger を先に更新する規則は維持する。本改訂は、当初の必須
gap-review 手順と「次の一手」による起動条件、およびそれらに依存する説明を置き換える。
また operational procedure から、inquiry-first の指定された順序、候補分類の枠数、
問いの自動登録を取り除く。以下の Decision がトラッキングと評価の現在の範囲を定める。

> **注記（2026-10-12、[ADR-0025](0025-planning-and-task-state-in-a-public-rfc-store.ja.md)）:** private ledger と ledger を先に
> 更新する規則は、もう効力を持たない。Decision の下の注記を参照。

## Context

public intervention timeline と private な作業 ledger は異なる目的を持つ。
timeline は、どの介入がいつ行われたかを記録する。empirical 層の規約により、
効果主張と私的な運用詳細を含めず、外部 collection に関する決定が抽象化の水準を定める。
ledger は deploy 状況、選択された候補、作業詳細を持つ。

両者を合わせると、公開観測記録が planning scratchpad になり、公開記録では抽象化すべき
情報が露出する。行動を検討・実施するときに運用状況を参照できることには引き続き意味がある。

著者は、指定された提案生成手順が探索を制約していると報告した。一般論として探究を
認めても、最初の問い、固定の読み順、候補分類、記録された成果を要求すれば、探究の形を
指定していることになる。その手順を再利用可能な skill に移しても、この制約はなくならない。

## Decision

実装トラッキングを **二層** で維持する。private ledger は deploy 状況、選択された
候補、作業詳細の operational source of truth。public timeline は、その日付付き・
効果主張なしの投影であり、運用詳細は [ADR-0012](0012-link-index-channel-selection.ja.md)
が定める水準に抽象化する。両者の役割を分離する。

> **注記（2026-10-12、[ADR-0025](0025-planning-and-task-state-in-a-public-rfc-store.ja.md)）:** 計画とタスクの状態の source of
> truth は、private ledger でなく公開 `rfcs/` store になった。機微な詳細はエントリから
> リンクする非公開の作業ノートに残す。Decision 1 は「1 つの commit でエントリの state と
> Status 節を更新し、implementation log に日付行を足す」と読む。Decision 2–4 の
> 「ledger」は store を指す。timeline は別の文書のままである。

> **注記（2026-10-12、[ADR-0026](0026-one-public-act-log-across-strategies.ja.md)）:** 運用詳細を ADR-0012 の水準に
> 抽象化する扱いは、公開の場で行った行為の場所と URL にはもう適用しない。ログはそれを
> 名指す。それらの行為は行った場所で既に公開されている。相手の反応・連絡先・個人的な
> 事情には、プライバシーの理由が引き続き適用される。

1. **実施後に更新する。** deploy された介入を ledger に先に記録し、次に public
   timeline に日付付きの投影を追加する。

2. **依頼された作業に応じて記録を参照する。** 状況、実現性、重複の確認に関係するときに
   ledger を使う。アイデアを求める依頼だけで、トラッキングや review の定型手順を起動しない。
3. **探索を開いておく。** thesis、戦術 catalog、過去の判断は、それらの前提への異論も含む
   思考の材料である。探索には必須の読み順、候補枠数、採点チェックリスト、記録義務を置かない。
4. **具体的な選択を文脈に応じて評価する。** 採用や実施を検討するときは、関係する根拠、
   tradeoff、行動の境界を確認する。既存の戦略判断との衝突は、その前提と改訂の可能性を
   議論する理由であり、自動的な却下理由ではない。案や問いは、記録を依頼されたときに保存する。

project 固有の artifact の場所は、該当作業で参照する保守規約に置く。
operational skill は必要に応じた判断補助を提供し、必須の発想手順を定めない。

## Alternatives Considered

**公開文書一つで追跡する。** 却下: 運用詳細と計画内容が timeline の empirical な役割と
privacy を損なう。

> **注記（2026-10-12、[ADR-0025](0025-planning-and-task-state-in-a-public-rfc-store.ja.md)）:** この代替案は却下のまま:
> timeline と計画は別の文書に留まる。ADR-0025 は計画を独自の store で公開する。
> 上の 2 つの理由はそれを妨げない: 計画は timeline に入らず、詳細は非公開に残して
> リンクする。

**再利用可能な skill に発想手順を指定する。** 却下: 手順を移しても、起点、候補の形、
出力への制御は残る。著者には現行 framework の適用と、その外側の探索の両方が必要である。

**実施記録を持たない。** 却下: deploy 状況と public intervention timeline の整合は
引き続き必要。強制的な思考手順を除くことは、実施済みの行動を記録する必要をなくさない。

## Consequences

**Positive.**

- public timeline は効果主張なしの介入記録であり続ける。
- 運用状況を参照できるまま、毎回の会話の起点にする必要がなくなる。
- 採用を判断する前に、現行の戦略の前提に異論を出せる。
- 保守と評価の指示を、それが支える具体的な作業に応じて参照できる。

**Negative.**

- deploy 後には引き続き二つの artifact を整合させる必要がある。
- 外部読者が見るのは私的な作業状態の lossy な投影である。
- 指定手順を除くだけでは発想の改善は確立されない。実際の会話での有用性を著者が判断する必要がある。

## Lineage

当初の 2026-06-13 の要望は、intervention timeline を継続的な運用記録にすることだった。
そこから二層の分離と必須の提案生成ループが生まれた。2026-09-07、著者は新しい案を縛る指示の
削減を求め、共通 operational skill と既存の戦略の前提を問い直すことを明示的に対象に含めた。

この program では、private ledger は project-memory note、public timeline は empirical 層の
implementation log である。場所は repo の保守資料に記す。以前の手順は version history に残り、
現行の運用は上記の改訂後の決定に従う。

> **注記（2026-10-12、[ADR-0025](0025-planning-and-task-state-in-a-public-rfc-store.ja.md)）:** project-memory の ledger は
> 非公開の archive へ移った。計画とタスクの状態は `rfcs/` に置き、timeline は
> implementation log のままである。
