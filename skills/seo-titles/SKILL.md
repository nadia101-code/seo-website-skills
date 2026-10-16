---
name: seo-titles
description: Use when optimizing page titles, meta descriptions, and JSON-LD schema for all site pages
---

# SEO Titles and Metadata Optimization

## When to Use

Run this skill after completing a site audit or when launching new pages. Use it to:
- Generate optimized title tags and meta descriptions for every page
- Assign focus keywords based on Search Console queries
- Add structured data (JSON-LD) for Article, Service, FAQPage, and Organization schemas
- Ensure uniqueness across all titles and descriptions

## First Run

On first run, this skill will:
1. Ask you to confirm `site-profile.md` is complete (site name, services, brand voice)
2. Fetch your sitemap and list all URLs
3. Pull Search Console queries for each URL (last 90 days)
4. Analyze current titles and descriptions for length, uniqueness, and keyword usage
5. Generate proposals for every page
6. Output a CSV with current vs proposed titles, descriptions, focus keywords, and JSON-LD schema
7. Wait for your approval before applying changes

## Inputs

- **Site profile** (required): Site name, URL, services, brand voice from `site-profile.md`
- **Search Console data** (required): Queries with impressions for each URL
- **Target pages** (optional): Specific URLs to optimize; if omitted, all pages in sitemap are included
- **SEO plugin** (optional): Yoast, Rank Math, or none (used to determine how to apply changes)

## Steps

1. **Fetch sitemap** from `sitemap.xml` or `sitemap_index.xml`
2. **Load Search Console queries** for each URL (last 90 days, minimum 5 impressions)
3. **Read current metadata** from each page (title tag, meta description, existing schema)
4. **Analyze current state:**
   - Title length (flag if <50 or >60 characters)
   - Description length (flag if <120 or >155 characters)
   - Duplicate titles or descriptions across pages
   - Missing focus keywords
   - Missing or incorrect schema
5. **Assign focus keywords:**
   - Primary keyword: highest-impression query for that URL
   - Secondary keywords: related queries with 10+ impressions
6. **Generate proposals:**
   - Title: 50–60 characters, primary keyword in first 10 words, brand at end
   - Description: 120–155 characters, action-oriented, includes secondary keyword if natural
   - Schema type: Article for blog posts, Service for service pages, FAQPage where Q&A exists, Organization for homepage
   - JSON-LD: Match visible page content; FAQ schema must match actual Q&A text on page
7. **Check uniqueness:** No two pages get identical titles or descriptions
8. **Output CSV** with columns: `url`, `current_title`, `proposed_title`, `current_description`, `proposed_description`, `focus_keyword`, `schema_type`, `json_ld`

## Checks

Before finalizing proposals:
- [ ] Every title is 50–60 characters
- [ ] Every description is 120–155 characters
- [ ] No duplicate titles across pages
- [ ] No duplicate descriptions across pages
- [ ] Focus keyword appears naturally in title and description
- [ ] Schema type matches page content (no Article schema on a service page)
- [ ] FAQPage schema only used where visible Q&A exists on page
- [ ] JSON-LD matches page text (e.g., FAQ questions in JSON match page H2s or bolded questions)
- [ ] Brand name is at end of title, not beginning

## Output

A CSV file with these columns:

| url | current_title | proposed_title | current_description | proposed_description | focus_keyword | schema_type | json_ld |
|-----|---------------|----------------|---------------------|----------------------|---------------|-------------|---------|

**Example row:**

```
url: example.com/services/strategic-consulting
current_title: Consulting Services | Example
proposed_title: Strategic Business Consulting | Example Co.
current_description: We offer consulting services.
proposed_description: Expert strategic consulting for mid-market manufacturing. Process-driven, results-focused.
focus_keyword: strategic consulting
schema_type: Service
json_ld: {"@context":"https://schema.org","@type":"Service","name":"Strategic Business Consulting","provider":{"@type":"Organization","name":"Example Co."},"description":"Expert strategic consulting for mid-market manufacturing firms."}
```

The JSON-LD column contains a complete, minified JSON-LD snippet ready to paste into the page `<head>`.

## Approval Gate

**Changes require explicit approval.**

After generating the CSV:
1. Present the first 5 rows as a sample
2. Ask: "Review the proposals. Reply 'approve all', 'approve only [list URLs]', or 'revise [URL] because [reason]'."
3. Wait for user response
4. If approved, apply changes via:
   - **Yoast/Rank Math**: Update title and description fields in plugin
   - **No plugin**: Update `<title>` tag and `<meta name="description">` in page `<head>`
   - **Schema**: Insert JSON-LD in `<head>` before closing `</head>` tag
5. After applying, provide verification steps (see below)

## Verification Steps

After changes are applied:
1. Spot-check 3 pages in Google: `site:example.com intitle:"Strategic Business Consulting"`
2. Use Google Search Console **URL Inspection** tool on 2–3 URLs to verify new title and description are crawled
3. Use **Rich Results Test** tool (search.google.com/test/rich-results) to verify schema validates
4. Check sitemap again to confirm no new duplicates introduced

Provide these as a checklist for the user to complete manually.

## Do Not

- **Do not promise rankings** — Optimized titles improve CTR, but rankings depend on content quality and backlinks
- **Do not keyword-stuff** — One mention of primary keyword in title, one in description
- **Do not use generic schema** — FAQPage requires visible Q&A on the page; don't add it "just because"
- **Do not copy competitor titles** — Inspiration is fine, copying is not
- **Do not apply changes without approval** — Always show current vs proposed and wait for confirmation
- **Do not rewrite existing good titles** — If current title is already 50–60 characters, includes keyword, and is unique, propose only minor tweaks or leave it
- **Do not add schema types that don't match page content** — A blog post is not a Service, a service page is not an Article
