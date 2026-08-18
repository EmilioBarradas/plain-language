#!/usr/bin/env node
import { readFileSync } from "node:fs";
import { join } from "node:path";

const file = join(
  process.env.CLAUDE_PLUGIN_ROOT,
  "skills",
  "plain-language",
  "SKILL.md",
);
const text = readFileSync(file, "utf8");

process.stdout.write(text.replace(/^---\r?\n[\s\S]*?\r?\n---\r?\n/, ""));
