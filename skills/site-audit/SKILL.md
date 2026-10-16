---
name: site-audit
description: Use when running a comprehensive technical, on-page, indexing, and performance audit with prioritized fixes
---

# Complete Site Audit

## When to Use

Run this skill as your first step on a new site or quarterly to check overall health. Use it to:
- Audit all technical SEO issues (status codes, redirects, canonicals, HTTPS, mobile)
- Audit on-page SEO (titles, descriptions, H1, duplicate content, thin pages)
- Check indexing status from Search Console
- Measure performance (Core Web Vitals, PageSpeed mobile and desktop)
- Generate a full report prioritized by severity and SEO impact
- Provide step-by-step fixes with verification steps

## First Run

On first run, this skill will:
1. Ask you to confirm `site-profile.md` is complete (site URL, Search Console property)
2. Crawl your site (up to 100–200 pages, prioritizing sitemap)
3. Fetch technical data: status codes, redirects, canonicals, robots.txt, sitemap validity
4. Fetch on-page data: titles, meta descriptions, H1, duplicate content, images, alt text
5. Pull Search Console data: indexing coverage, excluded pages, reasons
6. Fetch PageSpeed data: mobile and desktop scores, Core Web Vitals
7. Categorize all issues by severity (critical, high, medium, low)
8. Output a full report with priority, evidence, fixes, and verification steps

## Inputs

- **Site profile** (required): Site URL, Search Console property from `site-profile.md`
- **Crawl depth** (optional): Full site (default) or sample of top X pages
- **Focus areas** (optional): "All" (default) or specific audits (technical, on-page, indexing, performance)

## Steps

### Phase 1: Technical Audit

1. **Status codes**: Crawl all URLs in sitemap + 404 detector for common paths
   - 200: OK ✓
   - 301/302: Redirect (check for chains)
   - 404: Broken link
   - 5xx: Server error
2. **HTTPS**: Verify all URLs use HTTPS, no mixed content
3. **Mobile usability**: Check viewport tag, font size, tap targets (44x44px minimum)
4. **Redirect chains**: Find A → B → C; recommend consolidating to A → C
5. **Canonicals**: Check for self-canonicals, loops, mismatches
6. **robots.txt**: Fetch and parse; check for overly restrictive rules
7. **Sitemap**: Validate XML structure, check for 404 URLs in sitemap
8. **SSL certificate**: Verify valid and not expired

### Phase 2: On-Page Audit

1. **Title tags**: Length (50–60 characters), uniqueness, keyword inclusion
2. **Meta descriptions**: Length (120–155 characters), uniqueness, clarity
3. **H1 tags**: One per page, includes target keyword, descriptive
4. **H2/H3 structure**: Logical hierarchy, no skipped levels
5. **Duplicate content**: Check for identical or near-identical pages
6. **Thin pages**: Flag pages under 100 words (may not rank)
7. **Images**: Check alt text completeness, file size, format (modern formats like WebP)
8. **Structured data**: Check for schema validation errors (use Rich Results Test)

### Phase 3: Indexing Audit

1. **Pull Search Console coverage report**:
   - Indexed: Count
   - Excluded: Count and top 3 reasons
   - Errors: Count and reasons
2. **Compare to sitemap**:
   - URLs in sitemap but not indexed (flag as issue)
   - URLs indexed but not in sitemap (may be ok, but review)
3. **Check for noindex**: Sample pages with noindex directive
4. **Mobile indexing**: Verify mobile version is indexed (if separate URLs)

### Phase 4: Performance Audit

1. **PageSpeed Insights** (mobile and desktop):
   - Performance score (0–100)
   - Core Web Vitals:
     - Largest Contentful Paint (LCP): < 2.5s is good
     - First Input Delay (FID) or Interaction to Next Paint (INP): < 200ms is good
     - Cumulative Layout Shift (CLS): < 0.1 is good
2. **Flag issues**:
   - Score < 50: Critical
   - Score 50–80: High
   - Score 80–90: Medium
   - Score > 90: Low
3. **Recommendations from PageSpeed**: Note top 3 optimization opportunities

### Phase 5: Categorize and Prioritize

1. **Severity levels**:
   - **Critical**: Blocks indexing or crawling (404s on homepage, noindex on money pages, 5xx errors)
   - **High**: Hurts rankings or CTR (missing titles, duplicate content, poor mobile UX, low PageSpeed)
   - **Medium**: Improves but not urgent (missing H1, thin alt text, redirect chains, orphan pages)
   - **Low**: Nice-to-haves (schema markup, image optimization, minor page structure)
2. **SEO impact**: Estimate impact (high, medium, low) based on affected pages and issue type
3. **Effort**: Quick wins vs time-consuming fixes

## Checks

Before finalizing report:
- [ ] All crawled URLs are from sitemap or discovered through navigation
- [ ] Status codes verified (no guessing)
- [ ] Search Console data is current (< 7 days old)
- [ ] PageSpeed scores are from official tool (not estimated)
- [ ] Duplicate content checked (not just identical text, but near-duplicates)
- [ ] Core Web Vitals field data included (if available; otherwise note "Not measured")
- [ ] Every issue has evidence (URL, screenshot, metric)
- [ ] Fixes are actionable (not vague; step-by-step)

## Output

**Example site audit report:**

```markdown
# Complete Site Audit Report

**Site**: example.com
**Date**: 2026-10-16
**Pages crawled**: 42
**Crawl duration**: 15 minutes

---

## Executive Summary

| Category | Issues Found | Critical | High | Medium | Low |
|----------|--------------|----------|------|--------|-----|
| Technical | 7 | 0 | 3 | 3 | 1 |
| On-Page | 12 | 1 | 5 | 4 | 2 |
| Indexing | 4 | 0 | 2 | 2 | 0 |
| Performance | 2 | 1 | 1 | 0 | 0 |
| **TOTAL** | **25** | **2** | **11** | **9** | **3** |

**Status**: ⚠️ 2 critical issues require immediate attention. 11 high-priority issues should be fixed within 1–2 weeks.

**Estimated time to fix all issues**: 8–12 hours (mix of quick wins and deeper work)

---

## Critical Issues (Fix Within 3 Days)

### 1. Homepage Title Tag Missing
- **URL**: example.com
- **Issue**: `<title>` tag is empty or placeholder
- **Evidence**: Page source line 12 (empty `<title></title>`)
- **Impact**: Page won't rank; search result shows URL only
- **Fix**: Add title tag (50–60 characters) including primary keyword
  - Example: `<title>Strategic Consulting for Manufacturers | Acme Co.</title>`
- **Verification**: 
  - Reload page, view page source, confirm `<title>` is now populated
  - Use URL Inspection in Search Console; title should appear
  - Wait 2–3 days for Google to recrawl

### 2. PageSpeed Score Critical (Mobile: 28/100)
- **URL**: example.com
- **Score**: 28/100 (mobile), 62/100 (desktop)
- **Core Web Vitals**:
  - LCP (Largest Contentful Paint): 7.2s ⚠️ (target: < 2.5s)
  - FID (First Input Delay): 180ms ✓ (good)
  - CLS (Cumulative Layout Shift): 0.15 ⚠️ (target: < 0.1)
- **Top optimization opportunities** (from PageSpeed):
  1. Reduce unused JavaScript (save 150KB)
  2. Serve images in modern format (WebP; save 200KB)
  3. Defer offscreen images (lazy load)
- **Impact**: Mobile users experience slow load times; Google penalizes slow sites
- **Fix**:
  - Enable gzip compression (check with hosting)
  - Minify CSS and JavaScript
  - Convert images to WebP
  - Lazy-load images below fold
  - Consider enabling caching plugin (e.g., WP Super Cache for WordPress)
- **Estimated time**: 2–4 hours
- **Verification**: Re-run PageSpeed after fixes; target mobile score > 75

---

## High-Priority Issues (Fix Within 1–2 Weeks)

### Technical (3 High Issues)

#### Issue 1: Redirect Chain
- **URLs**: example.com/blog/old-title → example.com/blog/2026/old-title → example.com/blog/post-title
- **Problem**: Users and Google follow multiple redirects; slows page load
- **Fix**: Update first redirect to point directly to final URL
  - Before: old-title → blog/2026/old-title → blog/post-title
  - After: old-title → blog/post-title
- **Verification**: Use online redirect checker; should show 1 redirect max
- **Effort**: 15 minutes

#### Issue 2: Broken Internal Links (12 found)
- **Examples**: 
  - example.com/resources/guide (404)
  - example.com/blog/post-old-name (404 but linked from homepage)
- **Problem**: Broken links hurt user experience and waste crawl budget
- **Fix**: 
  - Update internal links to point to correct URLs OR
  - Add 301 redirects from old URLs to new ones
- **Verification**: Use link checker tool; all internal links should return 200
- **Effort**: 30 minutes

#### Issue 3: Missing Canonical Tags on Paginated Pages
- **URLs**: example.com/blog/?page=2, example.com/blog/?page=3
- **Problem**: Google may treat each page as separate content; can cause duplicate content issues
- **Fix**: Add canonical tag to each paginated page pointing to page 1 OR use rel="next" and rel="prev"
  - Example: On page 2, add `<link rel="canonical" href="/blog/?page=1">`
  - OR use pagination rel tags: `<link rel="next" href="/blog/?page=2">` on page 1
- **Verification**: URL Inspection on page 2; canonical should show page 1
- **Effort**: 30 minutes (1 time; applies to all paginated pages)

### On-Page (5 High Issues)

#### Issue 4: Missing Meta Descriptions (8 pages)
- **Pages affected**: 
  - example.com/services/process-optimization (no description)
  - example.com/blog/case-study (no description)
  - (6 more resource pages)
- **Current**: Pages show URL in search results instead of description
- **Fix**: Add meta descriptions (120–155 characters) for each page
- **Verification**: Search for your pages; description should appear under title in results
- **Effort**: 45 minutes (8 pages × 5 minutes each)

#### Issue 5: Duplicate Title Tags (3 pages)
- **Examples**:
  - "Consulting Services | Acme Co." appears on 3 pages
  - "Process Optimization | Acme Co." appears on 2 pages
- **Problem**: Duplicate titles confuse search engines; Google may not rank all versions
- **Fix**: Make each title unique; include page-specific keyword
  - Page 1: "Strategic Business Consulting | Acme Co."
  - Page 2: "Process Optimization and Efficiency | Acme Co."
  - Page 3: "Change Management Consulting | Acme Co."
- **Verification**: Use a title checker or manually verify uniqueness
- **Effort**: 20 minutes

#### Issue 6: Missing H1 Tags (4 pages)
- **Pages**: 
  - example.com/about/team (no H1)
  - example.com/resources/whitepaper (no H1)
  - (2 more pages)
- **Problem**: H1 helps search engines understand page topic
- **Fix**: Add descriptive H1 to each page (matching or close to title, but unique)
- **Verification**: View page; H1 should be visible and unique per page
- **Effort**: 15 minutes

#### Issue 7: Thin Content (5 pages under 100 words)
- **Pages and word counts**:
  - example.com/thank-you (25 words)
  - example.com/404 (40 words)
  - example.com/resources/pdf-download (60 words)
  - (2 more pages)
- **Problem**: Google may not index thin pages; they rank poorly
- **Assessment**: Thank-you and 404 pages are intentionally thin (OK). Resource pages need expansion.
- **Fix**:
  - Thank-you and 404: Add noindex (intentionally thin pages)
  - Resource pages: Expand with description, use instructions, benefits (target 150–200 words)
- **Verification**: Recheck word count after editing
- **Effort**: 1 hour (resource page expansion)

#### Issue 8: Missing Alt Text (34 images)
- **Pages affected**: Blog posts, case study pages, about page
- **Problem**: Images without alt text hurt accessibility and miss SEO opportunity
- **Fix**: Write descriptive alt text (5–15 words) for all meaningful images
  - Decorative images get empty alt (`alt=""`)
- **Verification**: Inspect page source; every `<img>` should have alt attribute
- **Effort**: 1–2 hours (34 images × 2 minutes average)

### Indexing (2 High Issues)

#### Issue 9: 6 Pages with Duplicate Content Issues
- **Details from Search Console**: 6 pages marked "Duplicate without user-selected canonical"
- **Examples**:
  - example.com/blog/post-title and example.com/blog/post-title?utm_source=email (same content, different URL)
  - example.com/services/consulting and example.com/services/strategic-consulting (very similar content)
- **Fix**: 
  - Add canonical tag pointing to primary version OR
  - Use 301 redirect from duplicate to primary
- **Verification**: URL Inspection; canonical should point to primary page
- **Effort**: 30 minutes

#### Issue 10: 4 Pages Crawled But Not Indexed
- **Pages**: 
  - example.com/blog/tag/operations (tag archive)
  - example.com/resources/template-download (thin resource)
  - (2 more thin pages)
- **Reason from Search Console**: "Crawled - currently not indexed"
- **Assessment**: These pages are thin or low-value; Google crawls but doesn't index
- **Fix**: 
  - Option 1: Add noindex to these pages (prevent indexing)
  - Option 2: Expand content (150+ words) and add internal links
- **Recommendation**: Add noindex to tag archives and thin resource pages; they don't drive traffic
- **Verification**: URL Inspection after adding noindex; status should change
- **Effort**: 20 minutes

---

## Medium-Priority Issues (Fix Within 2–4 Weeks)

### Technical (3 Medium Issues)

1. **Mixed HTTP/HTTPS Content**: 2 images loaded over HTTP (not HTTPS)
   - Fix: Update image URLs to use HTTPS
   - Effort: 10 minutes
   
2. **Render-Blocking JavaScript**: 1 JS file blocks page rendering
   - Fix: Defer non-critical JS or inline critical CSS
   - Effort: 1 hour

3. **Missing robots.txt**: Confirm robots.txt exists and allows crawling
   - Check: Visit example.com/robots.txt
   - Fix: Create if missing; allow all important areas
   - Effort: 10 minutes

### On-Page (4 Medium Issues)

1. **Missing H2/H3 Structure**: 3 blog posts have only H1 (no subheadings)
   - Fix: Add H2 and H3 headings to break up content
   - Effort: 30 minutes (3 posts)

2. **Images Not Optimized**: 12 images are 500KB+ (should be < 150KB)
   - Fix: Compress images or serve in WebP format
   - Effort: 1–2 hours

3. **Old Blog Posts**: 2 posts from 2024 with no recent updates
   - Fix: Update dates, refresh content, add new examples
   - Effort: 1 hour (2 posts)

4. **No Related Posts Section**: Blog posts don't link to related content
   - Fix: Add "Related Posts" section at end of each post
   - Effort: 1 hour (manual for existing posts; automate for future)

---

## Low-Priority Issues (Fix Within 1 Month)

1. **Missing Schema Markup**: FAQ pages don't have FAQPage schema
   - Effort: 30 minutes; nice-to-have

2. **No Twitter/OG Meta Tags**: Social sharing uses defaults
   - Effort: 30 minutes; improves social CTR but doesn't affect rankings

3. **Sitemap Not Linked in robots.txt**: robots.txt doesn't mention sitemap
   - Effort: 5 minutes

---

## Crawl Statistics

| Metric | Count |
|--------|-------|
| **Total URLs crawled** | 42 |
| **Responsive (mobile-friendly)** | 42 (100%) ✓ |
| **HTTPS** | 42 (100%) ✓ |
| **Status 200** | 38 (90%) |
| **Status 301/302** | 3 (7%) |
| **Status 404** | 1 (2%) |
| **Avg page size** | 185 KB |
| **Avg load time** | 2.1s |

---

## Performance Summary

| Metric | Score | Status |
|--------|-------|--------|
| **Mobile PageSpeed** | 28/100 | 🔴 Critical |
| **Desktop PageSpeed** | 62/100 | 🟡 Medium |
| **LCP (mobile)** | 7.2s | 🔴 Critical (target: < 2.5s) |
| **FID (mobile)** | 180ms | 🟢 Good |
| **CLS (mobile)** | 0.15 | 🟡 Medium (target: < 0.1) |

**Biggest performance bottleneck**: Unoptimized images and render-blocking JavaScript.

---

## Fix Priority Roadmap

### Week 1 (Critical & Quick Wins)
- [ ] Add missing homepage title tag (5 min)
- [ ] Fix redirect chains (15 min)
- [ ] Update internal broken links (30 min)
- [ ] Add canonical tags to paginated pages (30 min)
- [ ] Start PageSpeed optimization (compress images, minify JS) — 2–4 hours

**Time**: ~4–5 hours; estimated impact: 20–30% improvement in search visibility

### Week 2 (On-Page SEO)
- [ ] Add missing meta descriptions (45 min)
- [ ] Make title tags unique (20 min)
- [ ] Add missing H1 tags (15 min)
- [ ] Expand thin resource pages (1 hour)
- [ ] Add alt text to 34 images (1–2 hours)

**Time**: ~4 hours; estimated impact: Better CTR, improved accessibility

### Week 3 (Indexing & Technical)
- [ ] Fix duplicate content (add canonicals or redirects) (30 min)
- [ ] Add noindex to thin/tag archive pages (20 min)
- [ ] Optimize remaining images (1–2 hours)
- [ ] Add H2/H3 structure to blog posts (30 min)

**Time**: ~2–3 hours; estimated impact: Cleaner index, faster crawl

### Week 4 & Beyond (Low Priority)
- [ ] Add schema markup (30 min)
- [ ] Add related posts sections (1 hour)
- [ ] Add OG/Twitter meta tags (30 min)

**Time**: ~2 hours

---

## How to Use This Report

1. **Start with Critical**: Fix the 2 critical issues first (title tag, PageSpeed)
2. **Follow the roadmap**: Week 1–4 breaks work into manageable chunks
3. **Run related skills**: 
   - `/seo-titles` to fix title and description issues
   - `/lead-check` to verify contact forms and CTAs
   - `/image-alt-text` for alt text bulk updates
   - `/internal-links` to fix broken links
4. **Track progress**: Rerun `/site-audit` in 4 weeks to measure improvement

---

## Verification After Fixes

1. **Resubmit sitemap** in Search Console
2. **Use URL Inspection** on 3–5 URLs to verify crawl and rendering
3. **Check Coverage report** in Search Console after 7 days
4. **Rerun PageSpeed** after performance fixes
5. **Monitor organic traffic** for gains over next 4–8 weeks
```

## Approval Gate

**No approval required.** This is a comprehensive audit and report. No changes are applied automatically.

However, high-priority fixes should be actioned within 1–2 weeks. If you need help with specific fixes, use related skills:
- `/seo-titles` → fix titles and descriptions
- `/lead-check` → verify forms and CTAs
- `/image-alt-text` → bulk alt text updates
- `/internal-links` → fix broken links
- `/noindex-review` → fix indexing issues

## Do Not

- **Do not report issues without evidence** — Every finding cites URL or metric
- **Do not crawl beyond sitemap** — Only analyze pages in sitemap + discovered pages
- **Do not invent PageSpeed scores** — Use only official PageSpeed Insights tool
- **Do not report Core Web Vitals if data unavailable** — Mark "not measured" if field data < 28 days old
- **Do not flag every small issue as critical** — Reserve critical for crawlability/indexing blockers
- **Do not promise rankings** — Report identifies issues; rankings depend on competition and backlinks
- **Do not recommend fixes without steps** — Every fix should have a step-by-step action plan
- **Do not ignore performance issues** — Poor PageSpeed hurts rankings on mobile (confirmed Google ranking factor)
