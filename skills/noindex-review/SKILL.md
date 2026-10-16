---
name: noindex-review
description: Use when auditing indexing directives, finding conflicts, and fixing crawl and index issues
---

# Noindex and Indexing Directive Review

## When to Use

Run this skill after a site audit, before launching a new site, or when Search Console shows unexpected indexing issues. Use it to:
- Find pages with `noindex` directives (meta robots, X-Robots-Tag headers)
- Detect canonical conflicts (canonical pointing elsewhere, noindex but canonical to self)
- Identify pages in sitemap but blocked by robots.txt or noindex
- Review Search Console indexing status (excluded by noindex, duplicate, crawled not indexed)
- Propose fixes for each indexing issue with evidence and verification steps

## First Run

On first run, this skill will:
1. Ask you to confirm `site-profile.md` has Search Console property URL
2. Fetch your sitemap and robots.txt
3. Check each URL for meta robots, X-Robots-Tag headers, and canonical tags
4. Pull Search Console indexing status for each URL
5. Classify each URL as: **index**, **noindex**, or **consolidate** (duplicate, should canonical elsewhere)
6. Flag conflicts (noindex but in sitemap, canonical loop, accidental noindex on money pages)
7. Output a report with current state, proposed action, and verification steps
8. Wait for approval before applying fixes

## Inputs

- **Site profile** (required): Search Console property URL
- **Search Console data** (required): Indexing status and exclusion reasons for each URL
- **Target pages** (optional): Specific URLs to check; if omitted, checks all URLs in sitemap + Search Console coverage report
- **Sitemap URL** (optional): If sitemap is not at `/sitemap.xml`, provide full URL

## Steps

1. **Fetch sitemap** from `/sitemap.xml` or `/sitemap_index.xml`
2. **Fetch robots.txt** from `/robots.txt` and parse Disallow rules
3. **For each URL in sitemap:**
   - Check `<meta name="robots" content="...">` tag in page `<head>`
   - Check HTTP response headers for `X-Robots-Tag`
   - Check `<link rel="canonical" href="...">` tag
4. **Pull Search Console indexing data:**
   - Coverage status: Indexed, Excluded, Error
   - Exclusion reason: "Excluded by 'noindex' tag", "Duplicate without user-selected canonical", "Crawled - currently not indexed", "Alternate page with proper canonical tag", "Soft 404", "Page with redirect"
5. **Classify each URL:**
   - **Index**: Should be indexed by Google (no noindex, no duplicate issue, in sitemap)
   - **Noindex**: Intentionally excluded (e.g., thank-you pages, staging pages, thin pages)
   - **Consolidate**: Duplicate or near-duplicate content, should canonical to a primary version
6. **Find conflicts:**
   - **Noindex but in sitemap**: URL has `noindex` directive but appears in sitemap
   - **Canonical loop**: Page A canonicals to B, B canonicals to A
   - **Canonical elsewhere but in sitemap**: URL canonicals to another page but is in sitemap (should not be)
   - **Noindex on money page**: Service page, product page, or homepage has noindex directive
   - **Robots.txt block but in sitemap**: URL is disallowed in robots.txt but appears in sitemap
7. **Propose fixes:**
   - For each conflict, show **current state**, **proposed fix**, and **verification step**
   - Group by severity: Critical (money pages with noindex), High (conflicts), Medium (thin pages crawled but not indexed), Low (intentional noindex pages in sitemap)
8. **Output report** with evidence (URL, directive found, Search Console status, proposed fix)

## Checks

Before finalizing report:
- [ ] Every URL classified as **index**, **noindex**, or **consolidate**
- [ ] No money pages (homepage, service, product pages from site-profile) are marked **noindex** without user confirmation
- [ ] Canonical URLs are live (200 status code)
- [ ] No canonical loops (A → B → A)
- [ ] Sitemap only includes URLs marked **index** (no noindex pages in sitemap)
- [ ] Robots.txt disallow rules are respected (URLs blocked by robots.txt are not in sitemap)

## Output

A markdown report organized by severity:

```markdown
# Noindex and Indexing Review

**Site**: example.com
**Date**: 2026-10-16
**URLs checked**: 45
**Critical issues**: 1
**High issues**: 3
**Medium issues**: 5
**Low issues**: 2

---

## Critical Issues

### Homepage has noindex directive
- **URL**: example.com
- **Current state**: `<meta name="robots" content="noindex, follow">`
- **Search Console status**: Excluded by 'noindex' tag
- **Evidence**: Page source line 12
- **Impact**: Homepage is not indexed by Google; site will not appear in search results
- **Proposed fix**: Remove `noindex` directive from `<head>`
- **Verification**: Use URL Inspection tool in Search Console after fix, request indexing, wait 3–7 days, check status

---

## High Issues

### Service page in sitemap but has noindex
- **URL**: example.com/services/consulting
- **Current state**: `<meta name="robots" content="noindex, follow">` + in sitemap
- **Search Console status**: Excluded by 'noindex' tag
- **Evidence**: Page source line 8, sitemap line 23
- **Impact**: Page is not indexed; backlinks and traffic are wasted
- **Proposed fix**: Remove `noindex` directive OR remove from sitemap (choose one)
- **Recommendation**: Remove `noindex` (this is a money page)
- **Verification**: URL Inspection after fix, request indexing

### Canonical loop detected
- **URL A**: example.com/services/strategic-consulting
- **URL B**: example.com/services/strategy-consulting
- **Current state**: A canonicals to B, B canonicals to A
- **Evidence**: Page source for both URLs
- **Impact**: Google cannot determine which version to index; both may be excluded
- **Proposed fix**: Choose one as primary (A), set B's canonical to A, remove A's canonical tag (self-canonical is default)
- **Recommendation**: A is older and has backlinks (check Search Console); make A primary
- **Verification**: URL Inspection on both URLs after fix

### Canonical elsewhere but in sitemap
- **URL**: example.com/blog/how-to-reduce-churn
- **Current state**: Canonicals to `example.com/insights/reduce-churn`, but both are in sitemap
- **Search Console status**: Alternate page with proper canonical tag
- **Evidence**: Sitemap lines 67, 89
- **Impact**: Sitemap includes duplicate URLs; Google ignores the alternate
- **Proposed fix**: Remove `example.com/blog/how-to-reduce-churn` from sitemap
- **Verification**: Resubmit sitemap, check coverage report in 3–7 days

---

## Medium Issues

### Thin pages crawled but not indexed
- **URLs**: 5 tag archive pages (example.com/tag/consulting, example.com/tag/strategy, ...)
- **Search Console status**: Crawled - currently not indexed
- **Evidence**: Coverage report → Excluded → Crawled - currently not indexed
- **Impact**: Google sees these as low-value; they won't rank
- **Proposed fix**: Add `noindex` to tag pages OR remove them from sitemap OR add more content (150+ words per tag page)
- **Recommendation**: Add `noindex, follow` to tag pages (preserves internal link equity, hides thin content)
- **Verification**: URL Inspection after fix, confirm exclusion reason changes to "Excluded by 'noindex' tag"

---

## Low Issues

### Intentional noindex pages in sitemap
- **URLs**: example.com/thank-you, example.com/coming-soon
- **Current state**: Noindex directive + in sitemap
- **Impact**: Minimal (these should not be indexed anyway), but sitemap should only include indexable pages
- **Proposed fix**: Remove from sitemap
- **Verification**: Resubmit sitemap

---

## Pass (No Issues)

- 32 URLs are indexed and in sitemap ✓
- No canonical conflicts on these URLs ✓
- No robots.txt blocks on indexed pages ✓

---

## Summary Actions

1. **Remove noindex from homepage** (critical)
2. **Remove noindex from service page OR remove from sitemap** (high)
3. **Fix canonical loop: choose primary version** (high)
4. **Remove alternate URL from sitemap** (high)
5. **Add noindex to 5 tag pages** (medium)
6. **Remove thank-you and coming-soon pages from sitemap** (low)

**Next steps**: Approve these fixes, apply them, then request reindexing via URL Inspection for critical and high-priority URLs.
```

## Approval Gate

**Changes require explicit approval.**

After generating the report:
1. Present all critical and high issues with evidence
2. Ask: "Review these issues. Reply 'approve all', 'approve only [list items]', or 'skip [item] because [reason]'."
3. Wait for user response
4. If approved, apply fixes via:
   - Remove `noindex`: Delete `<meta name="robots" content="noindex">` from page `<head>`
   - Add `noindex`: Insert `<meta name="robots" content="noindex, follow">` in page `<head>`
   - Fix canonical: Update `<link rel="canonical" href="...">` to point to correct URL
   - Update sitemap: Remove URLs that should not be indexed
5. After applying, provide verification checklist

**Never remove noindex from a money page (homepage, service, product) without user confirmation.**

## Verification Steps

After fixes are applied:
1. Use **URL Inspection** tool in Search Console for each fixed URL
2. Click **Request Indexing** for critical and high-priority URLs
3. Wait 3–7 days for Google to recrawl
4. Check **Coverage report** in Search Console to confirm status changed
5. For canonical fixes, verify in URL Inspection that "User-declared canonical" matches your intent

Provide these as a checklist for the user.

## Do Not

- **Do not remove noindex from money pages without approval** — Accidental noindex on homepage or service pages is critical, but removing noindex from a staging or dev page could expose unfinished content
- **Do not guess canonical URLs** — Use Search Console backlink data or user input to choose the primary version
- **Do not apply fixes in bulk without showing evidence** — Every fix must cite the page source, Search Console status, or robots.txt line
- **Do not promise instant indexing** — Google recrawls on its own schedule; 3–7 days is typical, but can take longer
- **Do not change canonical tags to point to 404 or redirect URLs** — Verify canonical target is live (200 status)
- **Do not remove pages from sitemap if they are the primary version** — Sitemap should include the canonical URL, not alternates
- **Do not flag "Crawled - currently not indexed" as critical** — This is common for thin or low-value pages; medium priority unless it affects money pages
