---
state: rejected 2026-06-28
---

## Summary

DeepWiki と Google Code Wiki 以外の repository wiki・要約サービスには onboard しない。

## Motivation

旧 ID: ledger 七巡目。

- GitSummarize: 型 a（合成 wiki）は DeepWiki と Code Wiki で足りている
- GitDiagram: 図だけで造語の署名を運ばない
- DeepWiki-Open / Grok-Wiki / RepoWiki / CodeWiki: self-hosted で、ADR-0020 が却下した自前の query 基盤にあたる
- Repowise / CodeBoarding: 著者自身の開発用で、第三者の LLM assistant が到達する面ではない
- Gitingest / Repomix / repo2txt / uithub: 読む側の前処理で、著者が onboard する操作がない

## Status

rejected — 再提案しない guard として残す（2026-10-12 plan で移送）。

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

なし。
