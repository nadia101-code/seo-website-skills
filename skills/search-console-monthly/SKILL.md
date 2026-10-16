---
name: search-console-monthly
description: Use when generating monthly Search Console performance reports with winners, decliners, and action plans
---

# Monthly Search Console Performance Report

## When to Use

Run this skill monthly (every 28 days) to track SEO progress. Use it to:
- Compare last 28 days vs previous 28 days (and year-over-year when available)
- Identify winning pages and queries (gains in clicks, impressions, CTR, position)
- Identify declining pages and queries (losses)
- Analyze traffic by country, device, and search appearance
- Review indexing status changes
- Generate a prioritized action plan for next month

## First Run

On first run, this skill will:
1. Ask you to confirm `site-profile.md` has Search Console property URL
2. Fetch Search Console data for last 28 days and previous 28 days
3. Calculate totals: clicks, impressions, CTR, average position
4. Find winners (pages/queries with significant gains)
5. Find decliners (pages/queries with significant losses)
6. Segment by country, device (desktop/mobile/tablet)
7. Check indexing status and coverage changes
8. Output a markdown report with actionable recommendations
9. Generate a prioritized action plan: which skill to run for each issue

## Inputs

- **Site profile** (required): Search Console property URL from `site-profile.md`
- **Date range** (optional): Default is last 28 days vs previous 28 days; can specify custom range
- **Year-over-year** (optional): Compare to same 28-day period last year (if data exists)
- **Focus pages** (optional): Specific URLs to analyze in detail

## Steps

1. **Load site profile** and extract Search Console property URL
2. **Fetch data from Search Console:**
   - **Period 1**: Last 28 days (e.g., 2026-09-18 to 2026-10-16)
   - **Period 2**: Previous 28 days (e.g., 2026-08-21 to 2026-09-17)
   - **Period 3** (optional): Year-over-year (same dates last year, if available)
3. **Calculate totals for each period:**
   - Total clicks
   - Total impressions
   - Average CTR (clicks ÷ impressions × 100)
   - Average position
4. **Calculate changes (Period 1 vs Period 2):**
   - Clicks change: absolute (+X) and percentage (+Y%)
   - Impressions change
   - CTR change
   - Position change (note: lower position number = better ranking)
5. **Find winners and decliners:**
   - **Winners**: Pages/queries with ≥20% gain in clicks OR ≥10% gain in impressions (minimum 10 clicks in Period 1)
   - **Decliners**: Pages/queries with ≥20% loss in clicks OR ≥10% loss in impressions (minimum 10 clicks in Period 2)
   - Set thresholds to avoid noise from low-volume queries
6. **Segment by:**
   - **Country**: Top 5 countries by clicks
   - **Device**: Desktop, mobile, tablet (clicks and CTR per device)
   - **Search appearance**: Rich results, AMP, image results (if applicable)
7. **Check indexing status:**
   - Pages indexed (count)
   - Pages excluded (count and top 3 reasons: noindex, duplicate, crawled not indexed)
   - New pages indexed since last report
   - Pages dropped from index
8. **Generate action plan:**
   - For each decliner, recommend a specific skill:
     - Lost clicks: `/keyword-optimize` for the page
     - Lost impressions: `/seo-titles` to improve title/meta
     - High impressions, low CTR: `/seo-titles` to make title more compelling
     - Indexing issues: `/noindex-review` or `/site-audit`
   - Prioritize by impact (clicks lost) and effort (quick wins first)
9. **Output markdown report** with:
   - Executive summary (totals, % change)
   - Winners and decliners (tables)
   - Country/device breakdown
   - Indexing status
   - Prioritized action plan

## Checks

Before finalizing report:
- [ ] All percentage changes are calculated correctly (Period 1 vs Period 2)
- [ ] Winners and decliners meet thresholds (≥20% change for clicks, ≥10% for impressions)
- [ ] No single-impression queries in winners/decliners (minimum 10 clicks)
- [ ] Position changes: lower = better (flag if position increased = ranking dropped)
- [ ] Indexing data is from Search Console coverage report, not guessed
- [ ] Action plan recommendations are specific (not "improve SEO")
- [ ] Year-over-year data included only if available (don't invent it)

## Output

**Example monthly report:**

```markdown
# Search Console Monthly Report

**Site**: example.com
**Period 1**: 2026-09-18 to 2026-10-16 (last 28 days)
**Period 2**: 2026-08-21 to 2026-09-17 (previous 28 days)
**Report date**: 2026-10-16

---

## Executive Summary

| Metric | Period 1 (Last 28d) | Period 2 (Previous 28d) | Change | % Change |
|--------|---------------------|-------------------------|--------|----------|
| **Clicks** | 1,247 | 1,089 | +158 | +14.5% ✓ |
| **Impressions** | 34,521 | 31,402 | +3,119 | +9.9% ✓ |
| **CTR** | 3.61% | 3.47% | +0.14pp | +4.0% ✓ |
| **Avg Position** | 12.3 | 13.1 | -0.8 | -6.1% ✓ (improved) |

**Status**: ✓ Positive month. Clicks, impressions, and CTR all up. Average position improved (lower = better).

---

## Winners (Top 5 by Click Gain)

| Page/Query | Period 1 Clicks | Period 2 Clicks | Change | % Change | Type |
|------------|-----------------|-----------------|--------|----------|------|
| example.com/services/strategic-consulting | 142 | 87 | +55 | +63% | Page |
| "strategic consulting for manufacturers" | 38 | 12 | +26 | +217% | Query |
| example.com/blog/case-study-manufacturing | 67 | 49 | +18 | +37% | Page |
| "process optimization ROI" | 22 | 8 | +14 | +175% | Query |
| example.com/services/process-optimization | 54 | 41 | +13 | +32% | Page |

**Analysis:**
- Strategic Consulting page gained 55 clicks (+63%) — likely from improved title/meta description changes made last month
- Query "strategic consulting for manufacturers" jumped 217% — new blog content and internal links may have helped
- Process Optimization page gaining traction (+32%) — consider keyword optimization to push further

---

## Decliners (Top 5 by Click Loss)

| Page/Query | Period 1 Clicks | Period 2 Clicks | Change | % Change | Type |
|------------|-----------------|-----------------|--------|----------|------|
| example.com/blog/how-to-reduce-churn | 34 | 78 | -44 | -56% | Page |
| "customer retention tactics" | 8 | 31 | -23 | -74% | Query |
| example.com/about/team | 12 | 28 | -16 | -57% | Page |
| "change management consulting" | 15 | 29 | -14 | -48% | Query |
| example.com/services/change-management | 41 | 52 | -11 | -21% | Page |

**Analysis:**
- Blog post "How to Reduce Churn" lost 44 clicks (-56%) — position may have dropped; check if a competitor published new content
- Query "customer retention tactics" lost 23 clicks — investigate if the page still ranks or if ranking dropped
- About page lost clicks — not a money page, but worth checking if internal links were removed

---

## High Impressions, Low CTR (Opportunities)

| Query | Impressions | Clicks | CTR | Avg Position |
|-------|-------------|--------|-----|--------------|
| "strategic planning framework" | 1,847 | 12 | 0.65% | 8.2 |
| "operations consulting" | 1,203 | 9 | 0.75% | 11.4 |
| "manufacturing efficiency" | 892 | 6 | 0.67% | 9.7 |

**Analysis:**
- These queries get impressions (page ranks on page 1 or 2) but few clicks
- Issue: Title or meta description not compelling
- **Recommendation**: Run `/seo-titles` to rewrite titles for these pages

---

## Traffic by Country

| Country | Clicks | Impressions | CTR | Avg Position | % of Total Clicks |
|---------|--------|-------------|-----|--------------|-------------------|
| United States | 987 | 27,341 | 3.61% | 11.8 | 79.1% |
| United Kingdom | 134 | 3,892 | 3.44% | 13.2 | 10.7% |
| Canada | 78 | 2,107 | 3.70% | 12.5 | 6.3% |
| Australia | 32 | 891 | 3.59% | 14.1 | 2.6% |
| Germany | 16 | 290 | 5.52% | 18.3 | 1.3% |

**Analysis:**
- US dominates traffic (79%)
- UK and Canada are secondary markets
- Germany has high CTR (5.52%) but low impressions — potential expansion market

---

## Traffic by Device

| Device | Clicks | Impressions | CTR | Avg Position | % of Total Clicks |
|--------|--------|-------------|-----|--------------|-------------------|
| Desktop | 821 | 21,403 | 3.84% | 11.9 | 65.8% |
| Mobile | 398 | 12,547 | 3.17% | 13.1 | 31.9% |
| Tablet | 28 | 571 | 4.90% | 12.8 | 2.2% |

**Analysis:**
- Desktop drives most clicks (65.8%)
- Mobile CTR lower (3.17% vs 3.84% desktop) — check if mobile titles are truncated or CTAs are visible
- Tablet CTR is high (4.90%) but low volume

---

## Indexing Status

| Status | Count | Change vs Last Month |
|--------|-------|----------------------|
| **Indexed** | 42 | +3 |
| **Excluded** | 18 | +2 |
| **Error** | 0 | 0 |

**Top exclusion reasons:**
1. Excluded by 'noindex' tag: 8 pages (intentional: thank-you pages, tag archives)
2. Duplicate without user-selected canonical: 6 pages (needs review)
3. Crawled - currently not indexed: 4 pages (thin content or low value)

**Analysis:**
- 3 new pages indexed this month (likely recent blog posts)
- 6 duplicate pages without canonical — run `/noindex-review` to fix
- 4 pages crawled but not indexed — check if content is thin or needs noindex

---

## Zero Impressions (Pages Not Ranking)

These pages are indexed but have 0 impressions in last 28 days:

- example.com/resources/whitepaper (indexed Oct 2, no impressions yet — new page, needs time)
- example.com/services/interim-leadership (indexed Aug 15, still no impressions — check if keywords target real searches)

**Analysis:**
- New pages need 2–4 weeks to rank
- Interim Leadership page may target keywords with no search volume — run `/keyword-research` to find better targets

**Note:** Zero impressions alone is not a content failure. Page may target branded terms or have no backlinks yet.

---

## Year-over-Year Comparison (Optional)

| Metric | 2026-09-18 to 2026-10-16 | 2025-09-18 to 2025-10-16 | Change | % Change |
|--------|--------------------------|--------------------------|--------|----------|
| Clicks | 1,247 | 1,024 | +223 | +21.8% |
| Impressions | 34,521 | 28,905 | +5,616 | +19.4% |

**Analysis:**
- Year-over-year growth: 21.8% more clicks than same period last year
- Steady improvement — content and technical SEO efforts are working

---

## Prioritized Action Plan for Next Month

### High Priority (Complete in next 7 days)

1. **Fix duplicate pages without canonical** (6 pages)
   - **Run**: `/noindex-review`
   - **Why**: Google can't determine which version to index; hurts both pages
   - **Estimated time**: 30 minutes

2. **Optimize declining blog post: How to Reduce Churn** (lost 44 clicks)
   - **Run**: `/keyword-optimize` on example.com/blog/how-to-reduce-churn
   - **Why**: Significant click loss; may have lost ranking or competitor published better content
   - **Estimated time**: 1 hour

3. **Rewrite titles for high-impression, low-CTR queries** (3 queries)
   - **Run**: `/seo-titles` for pages ranking for "strategic planning framework", "operations consulting", "manufacturing efficiency"
   - **Why**: Pages rank well but titles aren't compelling; improve CTR
   - **Estimated time**: 45 minutes

### Medium Priority (Complete in next 14 days)

4. **Optimize Change Management page** (lost 11 clicks)
   - **Run**: `/keyword-optimize` on example.com/services/change-management
   - **Why**: Money page losing clicks; keyword or content refresh needed
   - **Estimated time**: 1 hour

5. **Research keywords for Interim Leadership page** (0 impressions)
   - **Run**: `/keyword-research` to find queries people actually search
   - **Why**: Page has no impressions; may target terms with no search volume
   - **Estimated time**: 30 minutes

6. **Review mobile CTR** (3.17% vs 3.84% desktop)
   - **Run**: `/lead-check` on mobile to verify CTAs are visible and forms work
   - **Why**: Mobile CTR is lower; may be UX issue
   - **Estimated time**: 30 minutes

### Low Priority (Complete within 30 days)

7. **Add internal links to case study post** (winner, +18 clicks)
   - **Run**: `/internal-links` to strengthen this page with more inbound links
   - **Why**: Page is gaining traction; more internal links will boost authority
   - **Estimated time**: 30 minutes

8. **Write new blog post targeting "customer retention tactics"** (lost 23 clicks)
   - **Run**: `/blog-writer` to reclaim lost traffic with fresh content
   - **Why**: Query lost clicks; competitor may have published new content
   - **Estimated time**: 2 hours

---

## Summary

**Overall performance**: ✓ Positive month. Clicks up 14.5%, impressions up 9.9%.

**Biggest wins**:
- Strategic Consulting page: +55 clicks
- Process Optimization page gaining traction

**Biggest concerns**:
- "How to Reduce Churn" blog post: -44 clicks
- 6 duplicate pages without canonical
- Mobile CTR lower than desktop

**Next steps**: Complete high-priority actions in next 7 days. Focus on fixing duplicates and optimizing declining pages.

---

**Track progress**: Run `/search-console-monthly` again in 28 days (next report due: 2026-11-13).
```

## Approval Gate

**No approval required.** This is a report-only skill. It does not modify the site.

However, the action plan recommends which skills to run next. User can approve and run those skills separately.

## Do Not

- **Do not promise specific ranking improvements** — This is a performance report; rankings depend on many factors
- **Do not flag every small change** — Use thresholds (≥20% for clicks, ≥10% for impressions) to avoid noise
- **Do not mark zero-impression pages as failures** — New pages need time; branded queries may have low volume
- **Do not compare incomparable periods** — Always use same-length periods (28 days vs 28 days, not 28 vs 30)
- **Do not invent data** — If year-over-year data doesn't exist, omit that section
- **Do not recommend "improve SEO" generically** — Recommendations must be specific skills with clear actions
- **Do not ignore device differences** — Mobile and desktop traffic may have different CTRs and positions
- **Do not treat position increase as improvement** — Position 15 → 20 is a ranking drop (higher number = worse)
