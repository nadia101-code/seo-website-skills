---
name: keyword-research
description: Use when finding and grouping keywords by intent, mapping to URLs, and detecting cannibalization
---

# Keyword Research and Mapping

## When to Use

Run this skill before launching new content or when planning site structure. Use it to:
- Find keywords based on your services and Search Console queries
- Group keywords by intent (transactional, commercial, informational)
- Map keywords to target URLs (which page should rank for which keyword)
- Detect keyword cannibalization (two pages targeting the same query)
- Build a keyword-to-URL map for content planning

## First Run

On first run, this skill will:
1. Ask you to confirm `site-profile.md` is complete (services, target audience, locations)
2. Ask for seed keywords (from services) or pull from Search Console
3. Use web search to find related keywords (autocomplete, related searches, People Also Ask)
4. Group keywords by intent (transactional, commercial, informational)
5. Check which keywords your site already ranks for (from Search Console)
6. Detect cannibalization: two or more URLs ranking for the same keyword
7. Map each keyword to its recommended target URL
8. Output a table with keyword, intent, search volume (if available), target URL, and cannibalization status

## Inputs

- **Site profile** (required): Services, target audience, locations from `site-profile.md`
- **Seed keywords** (optional): Starter keywords to expand from; if omitted, uses services from site-profile
- **Search Console data** (recommended): Queries your site already ranks for (last 90 days)
- **Search volume source** (optional): If you have Semrush or Ahrefs API, include search volume; otherwise mark "not measured"

## Steps

1. **Load site profile** and extract:
   - Services or products (e.g., "strategic consulting", "process optimization")
   - Target audience (e.g., "mid-market manufacturing")
   - Target locations (e.g., "United States", "United Kingdom")
2. **Generate seed keywords:**
   - From services: "[service]", "[service] for [audience]", "[service] in [location]"
   - Example: "strategic consulting", "strategic consulting for manufacturers", "strategic consulting in Chicago"
3. **Expand keywords using web search:**
   - **Google autocomplete**: Type seed keyword + [space], note suggestions
   - **Related searches**: Bottom of Google results page
   - **People Also Ask**: Extract questions from SERP
   - **Search Console**: Pull queries with ≥5 impressions (last 90 days)
4. **Categorize by intent:**
   - **Transactional**: "buy", "hire", "get", "sign up", "book" (user ready to convert)
   - **Commercial**: "best", "top", "vs", "review", "compare" (user evaluating options)
   - **Informational**: "how to", "what is", "guide", "tips", "why" (user learning)
   - **Navigational**: Brand name or specific page (e.g., "Acme Consulting login")
5. **Map to target URLs:**
   - **Transactional/Commercial**: Service pages, product pages, contact page
   - **Informational**: Blog posts, resource pages, guides
   - **Navigational**: Exact page (homepage, login page)
   - Check if page exists; if not, mark "new page needed"
6. **Detect cannibalization:**
   - From Search Console, find queries where 2+ URLs rank
   - Example: "strategic consulting" ranks for both example.com/services/consulting AND example.com/about
   - Mark as cannibalization; recommend consolidating to primary URL
7. **Search volume** (optional):
   - If Semrush/Ahrefs API is connected, pull monthly search volume
   - If not available, mark "not measured"
   - Never invent search volume numbers
8. **Output table:**
   - Columns: `keyword`, `intent`, `search_volume`, `target_url`, `current_ranking_urls`, `cannibalization`, `priority`
   - Sort by priority: transactional first, then commercial, then informational

## Checks

Before finalizing table:
- [ ] Every keyword is assigned an intent (transactional, commercial, informational, navigational)
- [ ] Target URLs are logical (transactional keywords → service pages, informational → blog)
- [ ] Cannibalization detected where 2+ URLs rank for same keyword
- [ ] Search volume marked "not measured" if no API connected (don't invent numbers)
- [ ] Priority assigned: high (transactional, money keywords), medium (commercial), low (informational)
- [ ] No duplicate keywords in table
- [ ] Seed keywords from site-profile services are all included

## Output

**Example keyword research table:**

```markdown
# Keyword Research and Mapping

**Site**: example.com
**Date**: 2026-10-16
**Services**: Strategic consulting, process optimization, change management
**Target audience**: Mid-market manufacturing companies
**Data sources**: Search Console (last 90 days), web search (autocomplete, related searches, PAA)

---

## Keyword Map (50 keywords)

| Keyword | Intent | Search Volume | Target URL | Current Ranking URLs | Cannibalization | Priority |
|---------|--------|---------------|------------|----------------------|-----------------|----------|
| strategic consulting | Commercial | Not measured | example.com/services/strategic-consulting | example.com/services/strategic-consulting (pos 8), example.com/about (pos 23) | ⚠️ Yes | High |
| hire strategic consultant | Transactional | Not measured | example.com/services/strategic-consulting | None | No | High |
| strategic consulting for manufacturers | Commercial | Not measured | example.com/services/strategic-consulting | example.com/services/strategic-consulting (pos 12) | No | High |
| process optimization consulting | Commercial | Not measured | example.com/services/process-optimization | None | No | High |
| change management consulting | Commercial | Not measured | example.com/services/change-management | example.com/services/change-management (pos 14) | No | High |
| best consulting firms for manufacturing | Commercial | Not measured | example.com/blog (new post needed) | None | No | Medium |
| strategic planning vs strategic consulting | Commercial | Not measured | example.com/blog (new post needed) | None | No | Medium |
| how to reduce customer churn | Informational | Not measured | example.com/blog/how-to-reduce-churn | example.com/blog/how-to-reduce-churn (pos 18) | No | Medium |
| what is process optimization | Informational | Not measured | example.com/blog (new post needed) | None | No | Low |
| strategic consulting case studies | Informational | Not measured | example.com/blog/case-study-manufacturing | example.com/blog/case-study-manufacturing (pos 22) | No | Low |

*(Showing 10 of 50 keywords; full table available in export)*

---

## Cannibalization Issues (2 Found)

### Issue 1: "strategic consulting"
- **URLs ranking**: 
  1. example.com/services/strategic-consulting (position 8, 45 impressions)
  2. example.com/about (position 23, 8 impressions)
- **Problem**: About page is competing with service page for the same keyword
- **Recommendation**: 
  - Remove "strategic consulting" keyword from About page OR
  - Add canonical tag on About page pointing to service page OR
  - Add internal link from About to service page with "strategic consulting" anchor text
- **Skill to run**: `/internal-links` or `/noindex-review` (if About page has no other purpose)

### Issue 2: "process optimization"
- **URLs ranking**:
  1. example.com/services/process-optimization (position 14, 18 impressions)
  2. example.com/blog/what-is-process-optimization (position 19, 12 impressions)
- **Problem**: Blog post and service page compete
- **Recommendation**: This is acceptable IF:
  - Service page targets transactional/commercial intent ("hire us")
  - Blog post targets informational intent ("how it works")
  - Add internal link from blog post to service page
- **Skill to run**: `/keyword-optimize` to differentiate intents

---

## Keywords by Intent

### Transactional (10 keywords)
- hire strategic consultant
- book a strategy call
- get consulting quote
- strategic consulting services near me
- hire process optimization consultant
- change management consulting services
- consulting for manufacturing companies
- strategic planning consulting
- operations consulting services
- interim leadership consulting

**Recommendation**: These should map to service pages or contact page. High conversion intent.

### Commercial (18 keywords)
- strategic consulting
- strategic consulting for manufacturers
- process optimization consulting
- best consulting firms for manufacturing
- strategic planning vs strategic consulting
- change management consulting
- top strategy consultants
- operations consulting firms
- strategic consulting companies
- business transformation consulting
- consulting for mid-market companies
- manufacturing consulting services
- operational excellence consulting
- lean manufacturing consulting
- six sigma consulting
- process improvement consulting
- supply chain optimization consulting
- strategic sourcing consulting

**Recommendation**: Service pages for owned services; blog comparison posts for "best" and "vs" queries.

### Informational (22 keywords)
- how to reduce customer churn
- what is process optimization
- strategic consulting case studies
- how to improve operational efficiency
- change management best practices
- strategic planning framework
- what is lean manufacturing
- how to implement six sigma
- process optimization examples
- change management models
- strategic consulting process
- how to reduce costs in manufacturing
- operational efficiency metrics
- KPIs for manufacturing
- strategic planning steps
- how to improve employee retention
- what is continuous improvement
- process mapping guide
- root cause analysis template
- strategic planning template
- change management checklist
- consulting proposal template

**Recommendation**: Blog posts, guides, templates. High traffic potential; builds authority.

---

## Keyword-to-URL Map

| URL | Primary Keywords | Secondary Keywords | Page Status |
|-----|------------------|-------------------|-------------|
| example.com/services/strategic-consulting | strategic consulting, hire strategic consultant | strategic consulting for manufacturers, strategic planning consulting | Exists |
| example.com/services/process-optimization | process optimization consulting, hire process optimization consultant | lean manufacturing consulting, six sigma consulting | Exists |
| example.com/services/change-management | change management consulting | change management best practices, change management models | Exists |
| example.com/contact | book a strategy call, get consulting quote | hire strategic consultant | Exists |
| example.com/blog/how-to-reduce-churn | how to reduce customer churn | employee retention, customer retention | Exists |
| example.com/blog/case-study-manufacturing | strategic consulting case studies | manufacturing case study, process optimization examples | Exists |
| example.com/blog (new post) | best consulting firms for manufacturing | top strategy consultants, consulting for mid-market companies | **New page needed** |
| example.com/blog (new post) | strategic planning vs strategic consulting | difference between strategy and consulting | **New page needed** |
| example.com/blog (new post) | what is process optimization | process optimization examples, process improvement | **New page needed** |
| example.com/blog (new post) | how to improve operational efficiency | operational efficiency metrics, KPIs for manufacturing | **New page needed** |

---

## Recommendations

### High Priority

1. **Fix cannibalization for "strategic consulting"**
   - Run `/internal-links` to link About page to service page
   - OR run `/noindex-review` to check if About page should target different keywords

2. **Create new blog post: "Best Consulting Firms for Manufacturing"**
   - Targets commercial intent keyword with no current page
   - Run `/blog-writer` with this keyword

3. **Optimize service pages for transactional keywords**
   - Run `/keyword-optimize` on all 3 service pages
   - Ensure "hire", "book", "get quote" CTAs are prominent

### Medium Priority

4. **Create new blog post: "What is Process Optimization?"**
   - Informational keyword with no page
   - Run `/blog-writer`

5. **Create new blog post: "Strategic Planning vs Strategic Consulting"**
   - Commercial comparison keyword
   - Run `/blog-writer`

### Low Priority

6. **Create resource templates** (strategic planning template, change management checklist, etc.)
   - Long-tail informational keywords
   - Can be blog posts with downloadable PDFs

---

## Search Volume Note

**Search volume is not measured** for this research. Recommendations are based on:
- Search Console impressions (proven demand for your site)
- Related searches and autocomplete (Google's signals of user intent)
- Keyword difficulty is not measured

If you connect Semrush or Ahrefs API, future runs will include:
- Monthly search volume
- Keyword difficulty score
- Trend data (growing vs declining keywords)

---

## Export

Full keyword list (50 keywords) available as CSV for content planning and tracking.

**Next steps:**
1. Fix cannibalization issues first (high priority)
2. Run `/keyword-optimize` on service pages
3. Run `/blog-writer` for new content opportunities
4. Track progress with `/search-console-monthly` in 28 days
```

## Approval Gate

**No approval required.** This is a research-only skill. It does not modify the site.

The output is a planning document. User can use it to:
- Prioritize content creation
- Fix cannibalization issues (via other skills)
- Optimize existing pages (via `/keyword-optimize`)

## Do Not

- **Do not invent search volume numbers** — If no API is connected, mark "not measured"
- **Do not promise rankings** — Keyword research identifies opportunities; rankings depend on content quality and competition
- **Do not recommend keywords outside the site's scope** — If site is B2B consulting, don't recommend B2C or unrelated keywords
- **Do not ignore cannibalization** — Competing pages hurt both; flag and recommend fixes
- **Do not map keywords to wrong intent** — Transactional keywords need service pages, not blog posts
- **Do not recommend "best X" posts without resources** — Comparison posts require data; don't suggest if user can't source it
- **Do not copy competitor keywords blindly** — Competitors may target wrong keywords or have different audience
- **Do not recommend keywords the user can't fulfill** — If site doesn't offer a service, don't recommend keywords for it
