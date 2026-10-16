---
name: site-structure
description: Use when auditing URL hierarchy, proposing structure improvements, and generating 301 redirect plans
---

# Site Structure and URL Hierarchy Audit

## When to Use

Run this skill when planning a redesign, reorganizing navigation, or improving crawl efficiency. Use it to:
- Audit current URL structure (hierarchy, naming conventions, depth)
- Identify orphans, overlaps, and cannibalizing pages
- Propose target hierarchy (homepage → services → blog → topics)
- Review URL naming rules (lowercase, hyphens, keyword inclusion)
- Generate 301 redirect plan if URLs change
- Ensure navigation supports crawling and user experience

## First Run

On first run, this skill will:
1. Ask you to confirm `site-profile.md` is complete (services, priority pages, CMS platform)
2. Fetch your sitemap and build URL tree
3. Analyze current structure: depth, naming patterns, categorization
4. Identify orphans (pages with no parent category), overlaps (multiple pages for same purpose), cannibalizing pages
5. Propose target structure aligned with best practices (homepage → category → page)
6. Review URL rules: lowercase, hyphens, no dates, keyword inclusion
7. If changes proposed, generate 301 redirect plan
8. Wait for approval before suggesting navigation changes

## Inputs

- **Site profile** (required): Services, priority pages, CMS platform from `site-profile.md`
- **Sitemap** (required): Current URL structure
- **Navigation structure** (optional): Current main menu, footer structure
- **Redesign scope** (optional): "Audit only" or "Propose full restructure"

## Steps

1. **Load site profile** and extract:
   - Services (hierarchical categories)
   - Priority pages (homepage, services, contact, blog hub)
   - CMS platform (WordPress, Shopify, custom, etc.)
2. **Fetch sitemap** and build URL tree:
   - Count total URLs
   - Map depth (homepage → /category → /subcategory → /page)
   - Identify categories and subcategories
3. **Analyze current structure:**
   - **Depth**: Ideal depth is 3 levels (homepage → category → page); 4+ is deep
   - **Naming**: Check for consistency (lowercase, hyphens, keyword inclusion)
   - **Patterns**: /blog/, /services/, /resources/, etc.
   - **Orphans**: Pages not in a category (e.g., /random-page or /old-page)
   - **Duplicates**: Multiple pages for same topic (e.g., /services/consulting AND /consulting-services)
4. **Identify hierarchy issues:**
   - **Overlapping services**: Two URLs for same service
   - **Cannibalizing pages**: Pages competing for same keyword
   - **Thin categories**: Categories with only 1–2 pages
   - **Deep nesting**: Pages 4+ levels deep (hurt crawlability)
5. **Propose target structure:**
   - **Homepage** (example.com)
   - **Services** (example.com/services)
     - Strategic Consulting (example.com/services/strategic-consulting)
     - Process Optimization (example.com/services/process-optimization)
     - Change Management (example.com/services/change-management)
   - **Blog Hub** (example.com/blog)
     - Individual posts (example.com/blog/post-title)
     - Optional categories (example.com/blog/category/operations)
   - **Resources** (example.com/resources) — optional
     - Whitepapers, templates, tools
   - **About** (example.com/about)
   - **Contact** (example.com/contact)
6. **Review URL naming rules:**
   - ✓ Lowercase
   - ✓ Hyphens (not underscores)
   - ✓ Descriptive (includes keyword or clear label)
   - ✓ No dates on evergreen pages (/blog/2026/10/ is bad; /blog/post-title is good)
   - ✓ Short (under 75 characters)
7. **Consolidate duplicates/overlaps:**
   - If two URLs target same keyword, choose one as primary
   - Recommend 301 redirect from secondary to primary
   - Update internal links to point to primary
8. **Generate 301 redirect plan** (if changes proposed):
   - Old URL → New URL
   - Reason for redirect
   - Verification step (check with URL Inspection after redirect)
9. **Output:**
   - Current URL tree (visual or list)
   - Proposed URL tree
   - Redirect plan (CSV or table)
   - Navigation proposal (menu structure)

## Checks

Before finalizing proposals:
- [ ] Every service has its own URL (no duplicates)
- [ ] No URL deeper than 4 levels (ideal is 3)
- [ ] All URLs are lowercase with hyphens
- [ ] No dates on evergreen pages
- [ ] All URLs are descriptive (readable, keyword-relevant)
- [ ] Orphan pages assigned to a category
- [ ] Blog posts are under /blog (not scattered in multiple folders)
- [ ] Navigation includes links to priority pages
- [ ] 301 redirects redirect to live pages (not 404s or chains)

## Output

**Example site structure audit:**

```markdown
# Site Structure and URL Hierarchy Audit

**Site**: example.com
**Date**: 2026-10-16
**Total URLs**: 42
**Current depth**: 4 levels (some pages too deep)
**Issues found**: 8 (3 high, 3 medium, 2 low)

---

## Current URL Tree

```
example.com/
├── (homepage)
├── about/
├── about/team/
├── about/careers/
├── services/
│   ├── strategic-consulting/
│   ├── process-optimization/
│   ├── strategy-consulting/ (DUPLICATE)
│   ├── change-management/
│   └── interim-leadership/
├── blog/
│   ├── 2026/10/
│   │   ├── post-title/ (DEEP - 4 levels)
│   │   └── another-post/
│   ├── 2026/09/
│   │   └── old-post/
│   └── resources/
│       ├── whitepaper.pdf
│       └── template.xlsx (NO CATEGORY - ORPHAN)
├── resources/
│   ├── templates/
│   ├── guides/
│   └── case-studies/
├── contact/
├── pricing/ (ORPHAN - not linked in navigation)
├── thank-you/
├── privacy/
└── terms/
```

---

## Issues Found

### High Priority

#### Issue 1: Duplicate URL for Strategic Consulting
- **Current URLs**: 
  - example.com/services/strategic-consulting
  - example.com/services/strategy-consulting
- **Problem**: Both target "strategic consulting" keyword; cannibalizing each other
- **Recommendation**: Keep example.com/services/strategic-consulting (already indexed); 301 redirect strategy-consulting to it
- **Redirect**: example.com/services/strategy-consulting → example.com/services/strategic-consulting

#### Issue 2: Blog Posts Too Deep (4 Levels)
- **Current structure**: example.com/blog/2026/10/post-title/
- **Problem**: Deep nesting hurts crawlability; date-based folders are outdated (pages rank for years, not just current month)
- **Recommendation**: Flatten to example.com/blog/post-title/
- **Redirects needed**: All blog posts from /blog/YYYY/MM/post-title/ → /blog/post-title/
- **Impact**: 28 blog post URLs affected

#### Issue 3: Orphan Resources Scattered
- **Current**: Resources in multiple locations:
  - example.com/blog/resources/
  - example.com/resources/
  - Templates and whitepapers scattered
- **Problem**: Inconsistent structure; hard to find resources
- **Recommendation**: Consolidate all resources to example.com/resources/ with subcategories:
  - example.com/resources/templates/
  - example.com/resources/guides/
  - example.com/resources/case-studies/
- **Redirects**: Merge /blog/resources/ into /resources/

---

### Medium Priority

#### Issue 4: Pricing Page Not Linked in Navigation
- **Current**: example.com/pricing exists but is orphan (not in menu)
- **Problem**: Page is hidden; users can't find it
- **Recommendation**: Either:
  - Add "Pricing" to main navigation OR
  - Delete page and move content to service pages OR
  - Redirect pricing to contact page (request quote)
- **Action**: Add to navigation (preferred) or remove if pricing is custom per client

#### Issue 5: Thank-You Page Publicly Indexed
- **Current**: example.com/thank-you is in sitemap and indexed
- **Problem**: Non-content page shouldn't appear in search results; wastes crawl budget
- **Recommendation**: Add noindex to thank-you page OR remove from sitemap
- **Redirect**: Not needed; just add `<meta name="robots" content="noindex">`

#### Issue 6: Multiple Redirect Chains
- **Current**: Some old blog URLs redirect to /blog/post-title/, which itself may redirect
- **Problem**: Redirect chains slow down page load and confuse search engines
- **Recommendation**: Audit all redirects; consolidate chains into single redirect
- **Example**: /blog/2024/old-title/ → /blog/2025/new-title/ → /blog/post-title/ should be /blog/2024/old-title/ → /blog/post-title/ (direct)

---

### Low Priority

#### Issue 7: Inconsistent Naming (Underscores in Some URLs)
- **Current**: Some old pages use underscores (example.com/old_page_name/)
- **Problem**: Hyphens are preferred by Google; underscores can cause issues
- **Recommendation**: Rename to use hyphens; 301 redirect old URLs
- **Example**: /old_page_name/ → /old-page-name/

#### Issue 8: About Subdirectories (About → Team → Careers)
- **Current**: example.com/about/team/, example.com/about/careers/
- **Problem**: Not wrong, but unusual structure for small site
- **Recommendation**: Keep as is IF these are substantial pages; OR move to example.com/team/ and example.com/careers/ (if they're primary navigation pages)
- **Assessment**: Low priority; depends on importance of these pages

---

## Proposed URL Tree

```
example.com/
├── (homepage)
├── about/
├── about/team/
├── about/careers/
├── services/
│   ├── strategic-consulting/
│   ├── process-optimization/
│   ├── change-management/
│   └── interim-leadership/
├── blog/
│   ├── post-title-1/
│   ├── post-title-2/
│   ├── post-title-3/
│   └── (all posts flat, no date folders)
├── resources/
│   ├── templates/
│   │   ├── strategic-planning-template/
│   │   └── process-mapping-template/
│   ├── guides/
│   │   ├── change-management-guide/
│   │   └── process-optimization-guide/
│   └── case-studies/
│       ├── case-study-manufacturing/
│       └── case-study-operations/
├── contact/
├── pricing/ (add to navigation)
├── privacy/
└── terms/
```

---

## URL Naming Rules Applied

| Rule | Current Status | Target |
|------|----------------|--------|
| Lowercase | ✓ Most URLs; some old ones use mixed case | ✓ All lowercase |
| Hyphens (not underscores) | ⚠️ Mix of hyphens and underscores | ✓ Hyphens only |
| Descriptive | ✓ Generally good | ✓ Keep pattern |
| No dates on evergreen pages | ✗ Blog uses /2026/10/ pattern | ✓ Flat /blog/post-title/ |
| Short and readable | ✓ Good | ✓ Maintain |

---

## 301 Redirect Plan

| Old URL | New URL | Reason | Priority | Verify With |
|---------|---------|--------|----------|-------------|
| example.com/services/strategy-consulting | example.com/services/strategic-consulting | Duplicate (same keyword) | High | URL Inspection |
| example.com/blog/2026/10/post-1/ | example.com/blog/post-1/ | Flatten deep hierarchy | High | URL Inspection |
| example.com/blog/2026/10/post-2/ | example.com/blog/post-2/ | Flatten deep hierarchy | High | URL Inspection |
| example.com/blog/2026/09/post-3/ | example.com/blog/post-3/ | Flatten deep hierarchy | High | URL Inspection |
| *(26 more blog posts)* | example.com/blog/[post-title]/ | Flatten all blog posts | High | Check sample |
| example.com/blog/resources/whitepaper | example.com/resources/guides/whitepaper/ | Consolidate resources | Medium | URL Inspection |
| example.com/blog/resources/template | example.com/resources/templates/template/ | Consolidate resources | Medium | URL Inspection |
| example.com/old_page_name/ | example.com/old-page-name/ | Fix underscore naming | Low | URL Inspection |

**Total redirects**: 31 (mostly blog posts; manageable)

---

## Navigation Proposal

### Main Navigation (Header)

```
Home | Services | Blog | Resources | About | Contact
              ↓        ↓         ↓        ↓
          - Strategic Consulting
          - Process Optimization     - Templates
          - Change Management        - Guides        - Team
          - Interim Leadership       - Case Studies  - Careers
```

### Footer Navigation

```
Company: About | Team | Careers | Contact
Resources: Templates | Guides | Case Studies
Legal: Privacy | Terms
```

**Changes**:
- Add "Resources" to main menu (currently hidden)
- Add "Pricing" to Services menu or main menu (currently orphan)
- Move Team and Careers to About submenu (already there; good)

---

## Implementation Plan

### Phase 1: Consolidate and Redirect (1–2 weeks)

1. Identify all blog posts in /blog/YYYY/MM/ structure
2. Flatten to /blog/post-title/
3. Set up 301 redirects in .htaccess or CMS
4. Test 10 redirects with URL Inspection to confirm they work
5. Consolidate resources: merge /blog/resources/ into /resources/

### Phase 2: Navigation Update (1 week)

1. Add "Resources" menu item
2. Add "Pricing" menu item (or hide page and remove URL)
3. Update all internal links to use new URLs
4. Remove old URLs from navigation

### Phase 3: Verification (2 weeks)

1. Submit updated sitemap to Search Console
2. Use URL Inspection on 5–10 pages to verify:
   - Redirects resolve correctly (no chains)
   - New URLs are crawled
   - Thank-you page shows noindex status
3. Check Search Console Coverage report for any errors
4. Monitor traffic for 2 weeks; watch for drops on redirected pages

---

## Do Not

- **Do not change URLs without 301 redirects** — Broken links hurt rankings and UX
- **Do not create deep nesting** — Keep to 3 levels max (homepage → category → page)
- **Do not use dates on evergreen pages** — /blog/2026/post/ is bad; /blog/post/ is good
- **Do not use underscores in URLs** — Use hyphens; underscores can confuse search engines
- **Do not leave orphan pages** — Every page should be linked from navigation or another page
- **Do not redirect to 404 or redirect chains** — Test redirects; they should go directly to live pages
- **Do not change homepage URL** — example.com should always redirect to homepage
- **Do not delete URLs without redirects** — Users and Google bookmarks will break
- **Do not make structural changes without planning** — URL changes affect crawling, links, and rankings; plan carefully

---

## Approval Gate

**Navigation changes require explicit approval. URL changes require approval + testing.**

After generating this audit:
1. Review the Issues Found and Proposed Tree above
2. Reply:
   - "Approve full restructure" → Implement all changes
   - "Approve high-priority only" → Redirects for duplicates and blog flattening only
   - "Skip [specific change]" → Implement others
   - "Revise [change]" → Claude adjusts proposal
3. Claude will generate final redirect plan and implementation steps
4. After approval, provide verification checklist for testing redirects

**Note**: This skill does NOT apply changes automatically. All URL and navigation changes must be approved and implemented manually or via CMS.
```

## Do Not

- **Do not apply 301 redirects without approval** — URL changes affect users and SEO; require explicit approval
- **Do not recommend deep nesting** — Ideal is 3 levels; 4+ hurts crawlability
- **Do not ignore redirect chains** — If A → B → C, consolidate to A → C
- **Do not leave orphan pages in sitemap** — Every page should be linked from navigation
- **Do not delete old URLs** — Use 301 redirects to preserve link equity
- **Do not use dates on evergreen blog posts** — /blog/2026/10/post breaks when you update the post
- **Do not recommend changing homepage URL** — It should always point to your domain root
