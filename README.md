# SEO Website Skills Bundle

A complete set of Claude skills for handling SEO tasks on any website. Each skill follows a structured audit-first approach with approval gates before making changes.

## What This Bundle Does

This collection provides 12 specialized skills that cover every aspect of website SEO — from technical audits and keyword research to content optimization and monthly reporting. All skills are generic and site-agnostic; site-specific details come from `site-profile.md`.

## Skills Overview

| Skill | Purpose | Requires Approval |
|-------|---------|-------------------|
| **seo-titles** | Generate optimized title tags, meta descriptions, and JSON-LD schema for all pages | Yes |
| **lead-check** | Verify contact forms, call buttons, WhatsApp links, and CTAs on every page | No (audit only) |
| **noindex-review** | Audit indexing directives, find conflicts, and propose fixes for crawl and index issues | Yes |
| **keyword-optimize** | Assign primary and secondary keywords to pages and propose natural placement | Yes |
| **internal-links** | Build link graph, find orphans, and propose internal linking opportunities | Yes |
| **image-alt-text** | Write descriptive alt text for all images based on context and content | Yes |
| **blog-writer** | Research, outline, draft, and QA blog posts based on search intent | Yes |
| **search-console-monthly** | Monthly performance report with winners, decliners, and prioritized action plan | No (report only) |
| **keyword-research** | Find and group keywords by intent, map to URLs, detect cannibalization | No (research only) |
| **competitor-analysis** | Analyze search and business competitors for structure, content, and proof signals | No (research only) |
| **site-structure** | Audit URL hierarchy, propose structure improvements, and generate redirect plans | Yes |
| **site-audit** | Full technical, on-page, indexing, and performance audit with prioritized fixes | No (audit only) |

## Recommended Order for a New Site

1. Fill out `site-profile.md` (required for all skills)
2. Run **site-audit** to get baseline technical health
3. Run **noindex-review** to fix indexing issues
4. Run **seo-titles** to optimize metadata and schema
5. Run **lead-check** to verify conversion paths
6. Run **keyword-research** to build keyword map
7. Run **keyword-optimize** for priority pages
8. Run **internal-links** to strengthen site structure
9. Run **image-alt-text** to complete accessibility
10. Run **blog-writer** for new content
11. Run **competitor-analysis** for positioning insights
12. Run **site-structure** for major URL or navigation changes
13. Run **search-console-monthly** every 28 days

## Required Connections

- **Windsor.ai `searchconsole`** — for Search Console data (queries, impressions, clicks, indexing status)
- **Windsor.ai `google_pagespeed`** — for Core Web Vitals and PageSpeed scores
- **Site editing connector** (if available) — for applying changes to WordPress, Shopify, or custom CMS

If a connector is missing, the skill will continue with available data and note what could not be retrieved.

## How to Use

1. **Set up site profile**: Copy and fill `site-profile.md` with your site details
2. **Connect data sources**: Link Search Console and PageSpeed via Windsor.ai connectors
3. **Run a skill**: Type `/seo-audit` or `/keyword-research` in Claude
4. **Review output**: Each skill produces a report, CSV, or proposal
5. **Approve changes**: For skills that modify the site, review the proposed changes and approve explicitly before they are applied

See [docs/getting-started.md](docs/getting-started.md) for detailed setup instructions.

## Limitations

- **No scheduled runs on free plans** — monthly reports must be triggered manually
- **No backlink data without API key** — competitor backlink analysis requires Semrush or Ahrefs API
- **No live form testing** — form submission and email delivery must be verified manually
- **No ranking promises** — SEO is long-term work; skills focus on best practices, not guaranteed results

## Global Principles

- **Generic by design** — no hardcoded brand names, domains, or services
- **Audit first, change later** — every skill shows evidence before proposing changes
- **Approval gates** — site modifications require explicit user approval
- **Evidence-based** — every finding cites its source (URL, Search Console query, tool output)
- **No spam tactics** — no keyword stuffing, fake reviews, link schemes, or cloaking

## Support

For issues or feature requests, open an issue in this repository.

## License

MIT License — use freely for any site.
