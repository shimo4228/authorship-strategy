Language: [English](0025-planning-and-task-state-in-a-public-rfc-store.md) | 日本語

# ADR-0025: 計画とタスクの状態を公開の RFC store に置く

> **要約.** ADR-0014 は private ledger を program の作業状態の operational source of
> truth とし、その日付付き・効果主張なしの投影だけを公開した。4 か月でその状態は
> 非公開の 4 か所に散り、セッションは現在の状態を 1 か所で読めなくなった。
> 本 ADR は計画とタスクの状態の source of truth を、この repository の公開 `rfcs/`
> store へ移す。1 エントリ 1 ファイルで、状態は front matter に置く。implementation
> log は別の文書のまま、intervention timeline とする。機微な詳細は非公開の作業ノートに
> 残し、エントリからリンクする。ADR-0014 が計画を公開しなかった理由は timeline と
> 詳細についてのもので、計画が timeline に入らず詳細が非公開に残るので、どちらも
> 保たれる。本 ADR が覆すのは「private ledger が source of truth」という ADR-0014 の
> 約束である。ADR-0014 の Decision 2–4 は維持し、「ledger」は store と読む。

## Status

accepted

## Date

2026-10-12

## Context

Plan: [docs/plans/rfcs-store-consolidation.html](../plans/rfcs-store-consolidation.html)（2026-10-12 承認）

**作業状態が非公開の 4 か所に散っていた。** 2026-10-11 の時点で、program の
開いている作業は次の場所にあった:

1. [ADR-0014](0014-implementation-tracking-two-tier-ledger.ja.md) の private
   implementation ledger。843 行の project-memory note で、deploy 履歴・候補の
   巡回・watch 項目・却下の guard を一つの流れに持っていた;
2. 非公開のタスク表。「作業状態」と「戦略状態」を分ける著者の判断（2026-07-06）で
   ledger とは別に置かれていた;
3. 作業ノート。著者の wiki から収穫した候補台帳を含む;
4. 引き継ぎファイル。2026-10-11 のセッションが、残る 15 項目を次のセッションへ
   運ぶために書いた。

同じ項目が 3 か所に現れることがあった。たとえば OpenAttribution の採否は、
タスク表の行・ledger の候補・引き継ぎの項目として、別々の文面で並んでいた。
ledger は自分の候補節を「次の一手の起点にしない歴史記録」と宣言しており、
読み手はどの部分がまだ状態なのかを知っている必要があった。件数を数えた
内部調査は plan の調査 report、
[docs/plans/research/2026-10-12-rfcs-store-consolidation.md](../plans/research/2026-10-12-rfcs-store-consolidation.md) にある。

**store を公開にする理由.** 集約だけなら非公開でもできる。著者が公開の store を
選んだのは、提案を却下した理由と、その隣にある開いた計画を公開記録の一部にするため
である。ADR が戦術を選んだ理由を記録するのと同じ扱いで、この framework が主張する
開放 —— 何を検討し、なぜそうしたかの日付つきで読める記録 —— に沿う。

**ADR-0014 の 2 つの理由.** ADR-0014 は、timeline と計画の両方を一つの公開文書で
運ぶ案を「運用詳細と計画内容が timeline の empirical な役割と privacy を損なう」として
却下した。前者は timeline についての理由で、intervention record に計画内容が入ると
下書き帳になる。後者は詳細についての理由で、連絡先、第三者の返信の状況、アカウントの
詳細、個人的な制約を指す。計画が timeline の外にあり、詳細が非公開に残る限り、
どちらの理由も計画そのものを非公開にすることを要しない。

**公開 store は既に規約として存在する.** 2026-08-25 から、著者の harness と
姉妹 repository はタスクを公開 `rfcs/` store に置いている。1 エントリ 1 ファイル、
決まった語彙の `state:` 欄、終端エントリは判断の公開記録としてその場に残す
（[claude-harness ADR-0049](https://github.com/shimo4228/claude-harness/blob/main/docs/adr/0049-unify-task-ledger-into-public-rfcs.md)）。
コマンド `claims.py ready` で repository の開いているエントリを一度に読める。
2026-10-11、著者はこの repository も同じ形にすると決めた。

## Decision

1. **計画とタスクの状態は `rfcs/` に置く.** store がその source of truth である。
   各エントリは 1 ファイルで、front matter に `state:` を持つ。開いているエントリは
   `draft`・`accepted`・`in_progress`・`blocked`。store は、どの ADR もまだ記録して
   いない却下の guard も終端エントリ（`rejected` か `withdrawn`）として持つ。理由が
   既に ADR にある guard はその ADR に残す。エントリは claude-harness ADR-0049 の
   store 規約と起票手順に従う。
2. **implementation log は別の文書のままとする.** [ADR-0023](0023-empirical-layer-role.ja.md) の、
   日付付き・効果主張なしの intervention timeline のままとする。計画内容は `rfcs/` へ
   行き、log には入らない。これで ADR-0014 の前者の理由が保たれる。

   > **注記（2026-10-12、[ADR-0026](0026-one-public-act-log-across-strategies.ja.md)）:** ログは著者のすべての
   > 戦略の行為を、行 ID と実施した戦略を添えて記録し、公開の場で行った行為は
   > 場所と URL を名指す。計画は引き続きログに入れない。
3. **機微な詳細は非公開に残し、リンクする.** 連絡先、第三者の返信の状況、アカウントの
   詳細、個人的な制約は非公開の作業ノートに残す。エントリは詳細があることを書き、
   そこへリンクする。リンクとそのファイル名にもそうした詳細を載せない。ADR-0014 の
   後者の理由は詳細の水準で保たれる。公開は取り消せないので、公開の前に
   `scripts/verify-public-detail.sh` がエントリと log を検査し、著者が diff を読む。
4. **実施は 1 つの commit で記録する.** 同じ commit で、エントリの state と Status 節を
   更新し、implementation log に日付行を足す。ADR-0014 Decision 1 の順序
   （private ledger が先、投影が後）をこれで置き換える。
5. **開いている項目はエントリとして移し、閉じた履歴は非公開に残す.** 旧 ledger・
   タスク表・引き継ぎの開いている項目は、それぞれ「旧 ID」行を持つエントリになる。
   2026-10-12 時点の ledger とタスク表は非公開の archive へ移す。その公開記録は
   implementation log、ADR、commit 履歴である。完了した作業のエントリを後から起票しない。
6. **project memory は store を指す.** 状態の写しでなく、`rfcs/` と
   implementation log へのポインタを持つ。

## Alternatives Considered

**private な二層 ledger を続ける.** 却下: 状態は既に 4 か所にあり、セッション境界を
一つ越えるのに引き継ぎファイルが要った。

**非公開の store 一つに集約する.** 非公開の store（gitignore した `rfcs/` か、
private ledger 一つ）でも散らばりは解消し、機微な詳細の検査も要らない。却下:
提案を却下した理由と開いた計画が、この framework が主張する公開記録の外に残る。
著者は公開の store と、それに伴う検査を選んだ。

**履歴の全体を公開する.** 却下: 843 行の ledger には、連絡先、第三者の handle、
運用の手順、実行 ID が全体に散っている。公開版は 1 行ずつの書き換えを要し、
deploy した介入を厳選した timeline として既に記録している log と `rfcs/` に並ぶ
3 つめの公開面を足すことになる。

**却下の guard を非公開に残す.** 却下: guard は状態である —— 次のセッションに
何を再提案しないかを伝える。guard を非公開の archive に置くと、状態は store と
archive に再び分かれる。

**ADR が持つものを含め、すべての guard に終端エントリを作る.** 却下: 同じ理由が
2 か所に置かれ、ずれていく。

**ADR-0014 への注記として記録する.** 却下: この判断は「private ledger が source of
truth」という ADR-0014 の中心の約束を覆す。もう成り立たない判断に注記を足すと、
現在の形が注記を通してしか読めなくなる。

## Consequences

**Positive.**

- `claims.py ready` でこの repository の開いている作業を一度に一覧できる。
- 却下した提案の理由が、開いている作業の隣に公開で残る。
- intervention timeline は empirical な役割を保ち、計画は入らない。
- 姉妹 repository と同じタスク規約に揃う。

**Negative.**

- 各エントリは公開前に機微な詳細の検査を要し、見落としは取り下げられない。
- エントリから非公開ノートへのリンクは公開の読み手には辿れない。エントリは、
  リンク先が何を持つかを本文で述べる必要がある。
- 旧 ID（タスク表の行、ledger の候補、引き継ぎの項目）は、各エントリの
  「旧 ID」行と非公開の archive にだけ残る。
- 公開記録の読み手には、実行されない項目を含む開いた計画が見える。
- private ledger を名指していた文書と道具を変える必要がある: 保守規約、
  implementation log 自身の保守の節、ledger を読み書きしていた scheduled task、
  この program の ledger を参照する姉妹の personal-branding 戦略の境界の決定。

**Revisit when.** エントリがプライバシーの事故を起こした、`rfcs/` への新規起票が
3 か月ない、著者が計画を非公開の場所に戻した。

## Lineage

ADR-0014（2026-06-13、2026-09-07 改訂）が二層 ledger を置いた。2026-07-06、
著者は ledger と統合せずタスク表を別に置いた。2026-10-11、ADR-0024 を書いた
セッションの終わりに、著者は `rfcs/` を計画と状態の唯一の場所とし、
implementation log を 2 つめの公開面とし、機微な詳細は非公開に残してリンクすると
決めた。2026-10-12 の plan が残りの問いを決めた: 注記でなく新しい ADR にする、
ADR が持たない guard だけを終端エントリにする、閉じた履歴は非公開の archive に置く、
personal-branding 戦略の行為はその戦略自身の行為ログから読み、写さない。実装の途中で著者は
非公開の store をもう一度検討し、機微な詳細の機械検査を付けて公開の store を維持した。

Relations:
- [ADR-0014](0014-implementation-tracking-two-tier-ledger.ja.md) を部分的に supersede する:
  計画とタスクの状態の source of truth としての private ledger と、Decision 1 の更新順。
  Decision 2–4（作業に応じて記録を参照する、探索を開いたままにする、具体的な選択を
  文脈で評価する）は維持し、「ledger」は store と読む。却下した代替案の第 1 項は
  却下のまま: timeline と計画は別の文書に留まる。
- [ADR-0023](0023-empirical-layer-role.ja.md): Decision は変わらない。log を ADR-0014 の
  ledger の投影とする記述に注記を付ける。
- [ADR-0024](0024-success-as-arrival-at-the-dated-record.ja.md): Decision 4 が private ledger に
  記録するとした evidence 段の事象は、該当する計器か channel の `rfcs/` エントリに記録し、
  見直し条件もこの store を読む。両戦略に仕える行為（Decision 5）は、この program が
  行う行為なら `rfcs/` と log に記録する。personal-branding 戦略の行為で record へ
  至るものは、その戦略自身の行為ログを読み、ここには写さない。その行為ログが唯一の記録だからである。
- [ADR-0021](0021-self-sovereign-entity-grounding.ja.md) と ADR-0022 は、書かれた時点の
  private ledger を名指す。改訂しない。
