---
name: internal-links
description: Use when building link graphs, finding orphan pages, and proposing internal linking opportunities
---

# Internal Link Strategy and Opportunities

## When to Use

Run this skill after a site audit or when launching new content. Use it to:
- Build a link graph showing which pages link to which
- Find orphan pages (few or no inbound links)
- Identify pages with high authority but few outbound links
- Propose internal linking opportunities with descriptive anchor text
- Strengthen topical clusters by linking related pages

## First Run

On first run, this skill will:
1. Ask you to confirm `site-profile.md` is complete (site structure, priority pages)
2. Fetch your sitemap and all page content
3. Build a link graph: for each page, count inbound and outbound links
4. Identify orphans: pages with 0–2 inbound links
5. Identify hubs: pages with high authority but few outbound links
6. Search for linking opportunities based on keyword overlap and topical relevance
7. Output a link plan CSV with source page, target page, anchor text, and placement suggestion
8. Wait for approval before applying changes

## Inputs

- **Site profile** (required): Site name, services, priority pages from `site-profile.md`
- **Sitemap** (required): All URLs to analyze
- **Target pages** (optional): Specific pages to improve linking for; if omitted, all pages are included

## Steps

1. **Load site profile** and identify:
   - Priority pages (homepage, services, money pages)
   - Navigation structure (main menu, footer, sidebars)
2. **Build link graph:**
   - For each page in sitemap, extract all `<a href="">` links
   - Count inbound links per page (links pointing to it)
   - Count outbound links per page (links it contains)
   - Classify links: internal (same domain), external, navigation (menu/footer), contextual (body)
3. **Identify orphans:**
   - Pages with 0 inbound internal links (except homepage)
   - Pages with 1–2 inbound links only
   - Mark severity: critical if money page, high if important page, medium if blog/resource
4. **Identify hubs:**
   - Pages with 10+ inbound links (high authority)
   - Pages with 0–2 outbound contextual links (underused authority)
   - Opportunity: link from hub to orphans or related pages
5. **Find linking opportunities:**
   - Analyze page topics using titles, headings, and keywords
   - Find topically related pages (e.g., "Strategic Consulting" → "Process Optimization")
   - Check for keyword overlap (e.g., both mention "manufacturing")
   - Propose links where anchor text is relevant and placement is natural
6. **Avoid:**
   - Exact-match anchors (too many links with identical text)
   - Broken links (404 targets)
   - Links in footer only (utility links, not contextual)
   - Links in navigation (already there)
7. **Output CSV** with:
   - `source_page`: URL that will contain the new link
   - `target_page`: URL being linked to
   - `anchor_text`: Proposed link text (descriptive, 2–5 words)
   - `placement`: Where on the page (e.g., "after first paragraph", "in benefits section", "before case studies")
   - `current_outbound_links`: Number of outbound contextual links on source page
   - `target_inbound_links`: Current number of inbound links to target page

## Checks

Before finalizing proposals:
- [ ] No exact-match anchor text repeated (vary anchor text across multiple links)
- [ ] Target URLs are live (200 status code)
- [ ] No broken internal links proposed
- [ ] Anchor text is descriptive (not "click here", "read more", "link")
- [ ] Placement suggestions are natural (fits in body, before/after relevant section)
- [ ] No link from low-priority page to high-priority page (wrong direction of authority)
- [ ] Orphan pages have at least 1 contextual inbound link proposed
- [ ] No more than 3–5 outbound links added per page (too many dilutes authority)

## Output

**Example link plan:**

```
# Internal Link Opportunities

**Site**: example.com
**Date**: 2026-10-16
**Pages analyzed**: 18
**Orphans found**: 3
**Hubs identified**: 2
**Link opportunities proposed**: 7

---

## Orphan Pages (0–2 inbound links)

### Critical
- example.com/services/process-optimization (0 inbound links)
  - Current outbound links: 12 (to external resources only)
  - Inbound opportunity: 2 links proposed
  - Priority: High (money page, should be linked from homepage and services page)

### High
- example.com/blog/case-study-manufacturing (1 inbound link from related post)
- example.com/about/team (1 inbound link from footer)

### Medium
- example.com/resources/whitepaper (2 inbound links)

---

## Link Hubs (10+ inbound links)

- example.com (homepage): 15 inbound links, 8 outbound links ✓ Healthy
- example.com/blog (blog hub): 12 inbound links, 4 outbound links → Can add more contextual links

---

## Link Opportunities (7 Proposed)

| Source Page | Target Page | Anchor Text | Placement | Current Source Outbound | Current Target Inbound | Priority |
|-------------|-------------|-------------|-----------|--------------------------|-------------------------|----------|
| example.com (Homepage) | example.com/services/process-optimization | Process optimization | In services list, after strategic consulting link | 8 | 0 | Critical |
| example.com/services/strategic-consulting | example.com/services/process-optimization | often paired with process optimization | In "Related services" paragraph | 3 | 0 | High |
| example.com/blog (hub) | example.com/blog/case-study-manufacturing | manufacturing case study | In recent posts section | 4 | 1 | Medium |
| example.com/blog/how-to-reduce-churn | example.com/resources/whitepaper | churn reduction whitepaper | After "Further reading" heading | 1 | 2 | Medium |
| example.com/about (About page) | example.com/blog/case-study-manufacturing | our team's work | In "Our impact" section | 2 | 1 | Low |
| example.com/services/strategic-consulting | example.com/about/team | our consultants | In "Who we are" section | 3 | 1 | Low |
| example.com/blog/case-study-manufacturing | example.com/services/process-optimization | process optimization | In methodology section, explaining approach | 0 | 0 | Low |

---

## Detailed Suggestions

### Priority 1: Link Homepage to Process Optimization Service

**Why**: Process Optimization is a money page with zero inbound links. Homepage is the highest-authority page and should link to all primary services.

**Current state**: Homepage services section links to Strategic Consulting only.

**Proposed change**:
- **Source**: example.com
- **Target**: example.com/services/process-optimization
- **Anchor text**: "Process optimization"
- **Placement**: In services section, after Strategic Consulting link
- **Current HTML**:
  ```html
  <ul>
    <li><a href="/services/strategic-consulting">Strategic Consulting</a></li>
    <li><a href="/services/change-management">Change Management</a></li>
  </ul>
  ```
- **Proposed HTML**:
  ```html
  <ul>
    <li><a href="/services/strategic-consulting">Strategic Consulting</a></li>
    <li><a href="/services/process-optimization">Process optimization</a></li>
    <li><a href="/services/change-management">Change Management</a></li>
  </ul>
  ```

**Verification**: After adding, check that link is clickable and target page loads.

---

### Priority 2: Link Strategic Consulting to Process Optimization

**Why**: These services are related; users reading about strategic consulting may be interested in process optimization work.

**Current state**: Strategic consulting page has 3 outbound links (all to external resources).

**Proposed change**:
- **Source**: example.com/services/strategic-consulting
- **Target**: example.com/services/process-optimization
- **Anchor text**: "often paired with process optimization" (varied, not exact-match)
- **Placement**: After "Our approach" section, before "Why choose us"
- **Proposed text**:
  ```
  Many clients combine strategic planning with process optimization—mapping the future 
  state while streamlining current operations. If you're exploring both, 
  our team often pairs these engagements for faster ROI.
  ```

**Verification**: Ensure placement reads naturally and link is in context.

---

### Priority 3: Link Blog Hub to Case Study

**Why**: Case study is a lead-generation asset with only 1 inbound link. Blog hub is a natural linking point.

**Current state**: Blog hub recent posts section links to 4 blog articles; none link to case study.

**Proposed change**:
- **Source**: example.com/blog
- **Target**: example.com/blog/case-study-manufacturing
- **Anchor text**: "manufacturing case study"
- **Placement**: In "Featured" or "Recommended" section on blog hub
- **Example HTML**:
  ```html
  <div class="featured">
    <h3>Featured Resource</h3>
    <p>See how we helped a mid-market manufacturer reduce churn by 18%: 
    <a href="/blog/case-study-manufacturing">our manufacturing case study</a></p>
  </div>
  ```

**Verification**: Confirm case study loads and is readable.

---

## Linking Best Practices (Included in Proposals)

1. **Anchor text**: Descriptive, 2–5 words, varied (not all exact-match)
2. **Placement**: In body (contextual), not just footer
3. **Quantity**: 3–5 outbound links per page (too many dilutes authority)
4. **Direction**: Link from authority pages to pages that need visibility
5. **Avoid**:
   - "Click here", "Read more", "Link" (non-descriptive)
   - Exact-match anchors on every link (looks spammy)
   - Linking to 404s or redirect chains
   - Links only in footer (not contextual)

---

## Approval Gate

**Changes require explicit approval.**

After generating the link plan:
1. Review the orphan pages and link opportunities above
2. Reply:
   - "Approve all" → Claude applies all 7 links
   - "Approve priorities 1–3 only" → Claude applies only high-priority links
   - "Skip [link name]" → Claude applies others
   - "Revise [link]" → Claude adjusts anchor text or placement
3. Claude will show exact HTML changes (current vs proposed)
4. After approval, Claude applies changes via WordPress editor, Shopify theme, or manual export

**Note**: Never link from a page to itself. Never link to 404 or redirect chains.

## Verification Steps

After links are applied:
1. Visit each source page and verify new link is visible and clickable
2. Click each new link and confirm target page loads (200 status code)
3. Use Google Search Console **URL Inspection** on a few target pages to verify they are indexed
4. Wait 2–4 weeks for Google to re-index and pass authority through new links

## Do Not

- **Do not add exact-match anchor text if it already exists** — Vary anchor text; multiple exact-match links look unnatural
- **Do not link to low-quality or thin pages** — Link to pages with substance (100+ words, real content)
- **Do not link from low-authority pages to money pages** — Authority flows in one direction; homepage → money pages is correct
- **Do not add more than 5 outbound links per page** — Too many dilutes authority and confuses users
- **Do not link to broken pages** — Verify target URLs are live (200 status code) first
- **Do not link from footer or navigation only** — Contextual links in body content are more valuable
- **Do not force links where they don't fit naturally** — If anchor text feels forced, skip the link
- **Do not apply changes without approval** — Always show current vs proposed HTML and wait for confirmation
