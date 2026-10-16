---
name: keyword-optimize
description: Use when assigning keywords to pages and proposing natural keyword placement in titles, headings, and body copy
---

# Keyword Optimization for Individual Pages

## When to Use

Run this skill for one page at a time to optimize it for search keywords. Use it to:
- Assign primary, secondary, and related keywords based on Search Console queries
- Review current keyword placement in title, H1, URL, meta description, intro, headings, and body
- Propose natural keyword placement in headings and short text blocks (2–4 sentences)
- Find search queries the page currently doesn't target
- Improve page relevance without rewriting existing content

## First Run

On first run, this skill will:
1. Ask you to confirm `site-profile.md` is complete (site name, services, brand voice)
2. Ask you to provide the target URL (required)
3. Ask if you want to rewrite existing content or only suggest additions
4. Fetch Search Console queries for that URL (last 90 days, minimum 5 impressions)
5. Read the page content (title, H1, URL, meta description, headings, body, images)
6. Analyze keyword placement and coverage
7. Propose primary keyword, secondary keywords, and placement suggestions
8. Wait for your approval before suggesting any edits

## Inputs

- **Target URL** (required): The page to optimize
- **Search Console data** (required): Queries with impressions and clicks for this URL (last 90 days)
- **Brand voice** (required): From `site-profile.md`
- **Rewrite preference** (optional): "Suggest additions only" (default) or "Suggest rewrites" for existing sections

## Steps

1. **Load site profile** for brand voice and target keywords from site description
2. **Fetch target URL** and read current content:
   - Title tag
   - Meta description
   - URL structure
   - H1 (main heading)
   - H2, H3 headings
   - Body copy (first 300 words, key paragraphs)
   - Images and alt text
3. **Pull Search Console queries** for this URL:
   - All queries with ≥1 impression (last 90 days)
   - Sort by impressions (highest first)
4. **Assign keywords:**
   - **Primary keyword**: Highest-impression query for this URL (e.g., "strategic consulting")
   - **Secondary keywords**: 3–5 queries with 10+ impressions and relevance to primary (e.g., "process optimization", "change management")
   - **Related keywords**: Lower-volume queries (5–10 impressions) that expand intent (e.g., "business consulting", "operations consulting")
5. **Analyze current placement:**
   - Primary keyword in title? (yes/no, position)
   - Primary keyword in H1? (yes/no, position)
   - Primary keyword in first 100 words? (yes/no)
   - Primary keyword in URL? (yes/no)
   - Secondary keywords mentioned? (count)
   - Keyword density: Count natural mentions of primary + secondary keywords (target: 1 per 100–150 words)
6. **Identify coverage gaps:**
   - Queries with 20+ impressions but not mentioned on page
   - Intent gaps (e.g., "how to" queries not addressed in page structure)
7. **Propose additions (no rewrites):**
   - For each under-covered keyword: suggest a 2–4 sentence paragraph or a new H2 heading
   - Show where it fits naturally (before existing section, after section, as new section)
   - Example: "Add after 'Our Approach' heading: '[Proposed text about process optimization]'"
8. **Optional: Propose rewrites** (if user chose "Suggest rewrites"):
   - Show current text and proposed revision side-by-side
   - Focus on adding secondary keywords and improving clarity
   - Keep original meaning and tone
9. **Output:**
   - Primary, secondary, and related keywords
   - Placement analysis (where keywords appear now)
   - CSV with: `query`, `impressions`, `clicks`, `current_placement`, `proposed_placement`
   - Markdown with proposed additions/rewrites

## Checks

Before finalizing proposals:
- [ ] Primary keyword is highest-impression query for this URL
- [ ] Secondary keywords are relevant (not random high-volume terms)
- [ ] Proposed text includes keywords naturally (no stuffing)
- [ ] No keyword appears more than once per 100 words
- [ ] Proposed additions fit naturally before/after existing sections
- [ ] No rewriting of existing good content (only additions suggested by default)
- [ ] Brand voice maintained in all proposed text

## Output

**Example keyword analysis:**

```markdown
# Keyword Optimization: Strategic Consulting Services

**URL**: example.com/services/strategic-consulting
**Date**: 2026-10-16
**Search Console data**: Last 90 days, 85 impressions, 12 clicks

---

## Keywords

| Type | Keyword | Impressions | Clicks | Current Placement | Proposed Placement |
|------|---------|-------------|--------|------------------|-------------------|
| Primary | strategic consulting | 45 | 8 | Title, H1, Intro | ✓ Keep as is |
| Secondary | process optimization | 18 | 2 | Body (once) | Add H2 section |
| Secondary | change management | 12 | 1 | Not mentioned | Add 2–3 sentences in Intro |
| Secondary | operational efficiency | 7 | 0 | Not mentioned | Add to Benefits section |
| Related | business consulting | 6 | 1 | Meta description | ✓ Keep as is |

---

## Current Placement Analysis

- **Title** (50 characters): "Strategic Business Consulting | Example Co." ✓ Primary keyword, brand name
- **Meta description** (135 characters): "Expert strategic consulting for mid-market manufacturing." ✓ Primary keyword, clear benefit
- **URL**: example.com/services/strategic-consulting ✓ Primary keyword, lowercase, hyphens
- **H1**: "Strategic Consulting for Manufacturing Companies" ✓ Primary keyword
- **H2 headings**:
  - "Our Approach" (no keyword)
  - "Case Studies" (no keyword)
  - "Why Work With Us" (no keyword)
- **First 100 words**: Primary keyword mentioned 1x ✓
- **Keyword density**: Primary + secondary: ~1.2 per 100 words ✓ Natural, not stuffed

---

## Coverage Gaps

### High-Priority Gaps (10+ impressions)

1. **"process optimization"** (18 impressions, 2 clicks)
   - Currently: Mentioned once in body
   - Issue: Not in heading; secondary keyword should have H2
   - Proposed: Add H2 "Process Optimization and Efficiency Gains"
   - Where: After "Our Approach" section

2. **"change management"** (12 impressions, 1 click)
   - Currently: Not mentioned
   - Issue: Users search for this; page doesn't address it
   - Proposed: Add 3–4 sentences in Intro or new paragraph after H1
   - Text suggestion:
     ```
     We guide companies through complex organizational changes—mergers, restructures, 
     technology rollouts—with proven change management frameworks. Resistance and 
     adoption challenges are common; our consultants help your team embrace new processes.
     ```

### Medium-Priority Gaps (5–9 impressions)

3. **"operational efficiency"** (7 impressions, 0 clicks)
   - Proposed: Add to Benefits section, no new heading needed
   - Text suggestion:
     ```
     Clients report 15–22% operational efficiency gains within 90 days 
     of implementing our recommendations.
     ```

---

## Proposed Changes

### Option 1: Additions Only (Recommended)

Add three short sections without rewriting existing content:

#### Add after Intro paragraph:

**Current intro:** "Strategic consulting is more than analysis. We work with your team to design and implement lasting change."

**Proposed addition (before "Our Approach" section):**

"Change Management That Sticks

We guide companies through complex organizational changes—mergers, restructures, technology rollouts—with proven change management frameworks. Resistance and adoption challenges are common; our consultants help your team embrace new processes and sustain new ways of working."

*Keywords: change management (new secondary keyword)*

#### Rename existing H2 heading:

**Current**: "Our Approach"

**Proposed**: "Process Optimization and Our Approach"

OR create new H2 after "Our Approach":

**Proposed H2**: "Process Optimization and Efficiency Gains"

**Proposed paragraph**:

"Whether you're streamlining workflows, consolidating operations, or rethinking vendor relationships, we use proven methodologies to eliminate waste and boost productivity. Typical clients see 15–22% operational efficiency gains within 90 days."

*Keywords: process optimization, operational efficiency*

#### Add to existing Benefits section:

**Current Benefits bullet**: "Faster decision-making cycles"

**Proposed bullet**: "Operational efficiency gains of 15–22% in 90 days"

---

### Option 2: Rewrite Existing Content (If user chose this)

**Only if user approved rewrites:**

**Current H1**: "Strategic Consulting for Manufacturing Companies"

**Proposed H1**: "Strategic Consulting and Process Optimization for Manufacturing"

*Adds: process optimization (secondary keyword)*

**Current first paragraph**: "Strategic consulting is more than analysis. We work with your team to design and implement lasting change."

**Proposed first paragraph**: "Strategic consulting and process optimization go hand in hand. Analysis alone doesn't move the needle. We work with your team to design, implement, and sustain lasting operational change that impacts your bottom line."

*Adds: process optimization, operational (from operational change)*

---

## Approval Gate

**No changes applied automatically.**

1. Review the keyword analysis and proposed additions above
2. Choose Option 1 (additions only) or Option 2 (rewrites)
3. Reply:
   - "Approve all" → Claude applies all suggestions
   - "Approve Option 1 only" → Claude adds new sections, keeps existing text
   - "Approve only [list specific changes]" → Claude applies only those
   - "Skip [specific change]" → Claude applies others
   - "Revise [change] because [reason]" → Claude refines and shows again

## Do Not

- **Do not promise rankings** — Keyword optimization improves relevance, but rankings depend on content quality, backlinks, and competition
- **Do not stuff keywords** — Natural placement only; target is 1 keyword mention per 100–150 words
- **Do not rewrite existing good content** — Additions are default; rewrites require user approval
- **Do not add keywords that don't fit the page** — Every proposed keyword should have Search Console impressions or clear user intent
- **Do not ignore related keywords** — Even low-volume keywords (5–9 impressions) can add value if natural
- **Do not change the URL** — URL changes require 301 redirects and Search Console recrawl; suggest only if user asks
- **Do not claim expertise in the topic** — Keyword placement is on-page SEO; topic expertise comes from your content writers and subject matter experts
