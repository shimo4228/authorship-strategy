---
state: draft 2026-10-12
review-when: zero-config・第三者 host・query 機能つきの MCP doc-server が公開される
---

## Summary

zero-config で第三者が host し、query 機能を持つ MCP doc-server が出たら再 gate する。自前では build しない（自前 server は ADR-0020 が却下した）。

## Motivation

旧 ID: ledger 八巡目 #19（2026-08-12 台帳化）。

- GitMCP badge（ADR-0020 の型 b）との重複は再 gate のときに整理する

## Status

draft — 発火条件の観測待ち（2026-10-12）。

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

該当するサービスが出たら ADR-0020 の基準で再 gate する。
