# plain-language

Response rules for AI coding agents, based on ISO 24495-1:2023, _Plain language — Part 1: Governing principles and guidelines_.

The rules are a single skill, [`skills/plain-language/SKILL.md`](skills/plain-language/SKILL.md), in the [Agent Skills](https://agentskills.io) format that most coding agents now read. Any agent with a skills directory can load it. Claude Code can also install it as a plugin, which loads the rules through a hook in every session.

## Install

As a Claude Code plugin, run these two commands inside Claude Code:

```
/plugin marketplace add EmilioBarradas/plain-language
/plugin install plain-language@plain-language
```

As a skill, run this command and pick your agents when the [skills CLI](https://skills.sh) prompts:

```bash
npx skills add EmilioBarradas/plain-language
```

## Install with Nix

Prerequisites:

- [Flakes enabled](https://wiki.nixos.org/wiki/Flakes) in your Nix configuration
- [home-manager](https://github.com/nix-community/home-manager) installed and configured

Add this repository as a flake input:

```nix
inputs.plain-language = {
  url = "github:EmilioBarradas/plain-language";
  flake = false;
};
```

Then, in your home-manager configuration, install it as a Claude Code plugin:

```nix
programs.claude-code.settings = {
  extraKnownMarketplaces.plain-language = {
    source = {
      source = "github";
      repo = "EmilioBarradas/plain-language";
    };
  };
  enabledPlugins."plain-language@plain-language" = true;
};
```

For other agents, link the skill into their skills directory:

```nix
home.file.".agents/skills/plain-language".source =
  "${inputs.plain-language}/skills/plain-language";
```

## Update

Claude Code plugin:

```
/plugin marketplace update plain-language
```

Skill:

```bash
npx skills update plain-language
```

Nix:

```bash
nix flake update plain-language
```

The Claude Code plugin updates through `/plugin marketplace update` in either case, since Claude Code fetches the marketplace from GitHub itself.

## Uninstall

Claude Code plugin:

```
/plugin uninstall plain-language
```

Skill:

```bash
npx skills remove plain-language
```
