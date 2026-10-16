---
name: competitor-analysis
description: Use when analyzing search and business competitors for positioning, content strategy, and differentiation insights
---

# Competitor Analysis

## When to Use

Run this skill when planning positioning or content strategy. Use it to:
- Identify search competitors (who ranks for your target keywords)
- Analyze business competitors (user-provided or inferred from services)
- Compare headlines, CTAs, proof elements, pricing signals
- Audit competitor content depth and publishing cadence
- Find backlink sources and referring domains (if connected)
- Generate evidence-based positioning insights

## First Run

On first run, this skill will:
1. Ask you to confirm `site-profile.md` is complete (services, target keywords)
2. Ask for business competitors (optional; will find search competitors from keyword research)
3. For each competitor:
   - Analyze homepage, service pages, and blog (top 5 posts)
   - Extract headlines, value propositions, CTAs
   - Review pricing signals (if publicly listed)
   - Count blog posts and estimate publishing cadence
   - Assess proof elements (testimonials, case studies, team)
   - Note backlink sources (if Semrush/Ahrefs API connected)
4. Generate comparison table
5. Output 3–5 evidence-based positioning insights
6. Generate a differentiation strategy (what makes your site stand out)

**Note:** This skill cannot and will not copy competitor content.

## Inputs

- **Site profile** (required): Services and target keywords from `site-profile.md`
- **Business competitors** (optional): URLs of known competitors; if omitted, finds search competitors from keywords
- **Search competitors** (optional): Auto-generated from top-ranking URLs for your keywords
- **Backlink data source** (optional): If Semrush or Ahrefs API is connected

## Steps

1. **Load site profile** and extract services and keywords
2. **Identify competitors:**
   - **Search competitors**: Use keyword research results; pull top 3–5 URLs ranking for primary keywords
   - **Business competitors**: From user-provided list or inferred from "competitors" field in site-profile
   - Combine into single list (3–5 competitors analyzed in depth)
3. **For each competitor, analyze:**
   - **Homepage**:
     - Headline (primary value prop)
     - Subheadline or supporting text
     - CTA text and placement
     - Visual elements (hero image, video, social proof)
   - **Service/Product pages** (top 2):
     - Page structure (sections, headings)
     - Primary and secondary CTAs
     - Proof elements (testimonials, case studies, stats)
     - Pricing signals (if listed)
   - **Blog**:
     - Total post count (if available)
     - Recent 5 posts (titles, publish dates)
     - Publishing frequency (e.g., 2 posts/month, 1 post/week)
     - Content topics (informational, commercial, product-focused)
   - **About/Trust**:
     - Proof elements (founder bios, team photos, credentials)
     - Client logos or testimonials
     - Awards or certifications
   - **Backlinks** (if data source connected):
     - Referring domains (count, top 5)
     - Link anchor text (most common)
     - Link sources (blogs, directories, news)
4. **Compare against your site:**
   - Build table: competitor, headline, services, CTA, blog frequency, proof elements
   - Note where you're aligned and where you differ
5. **Identify positioning gaps:**
   - What competitors claim (e.g., "fastest implementation", "lowest cost")
   - What competitors don't address
   - Where your services differ or are stronger
6. **Generate insights:**
   - 3–5 evidence-based findings (not speculation)
   - Each finding cites competitor examples
   - Focus on differentiation opportunities
7. **Output:**
   - Competitor comparison table
   - Positioning insights (markdown with evidence)
   - Differentiation strategy (what makes you unique)

## Checks

Before finalizing report:
- [ ] At least 3–5 competitors analyzed
- [ ] Each insight is backed by evidence (specific competitor data, not guesses)
- [ ] No copying of competitor content (analysis only)
- [ ] All URLs and data are from public pages
- [ ] Backlink data included only if source is connected (don't invent it)
- [ ] Pricing comparisons use only publicly listed prices
- [ ] Blog cadence calculated from verifiable data (publish dates on site)

## Output

**Example competitor analysis:**

```markdown
# Competitor Analysis

**Your site**: example.com
**Services**: Strategic consulting, process optimization, change management
**Target keywords**: Strategic consulting, process optimization consulting, change management
**Competitors analyzed**: 4 (3 search competitors, 1 business competitor)
**Date**: 2026-10-16

---

## Competitor Comparison

| Competitor | Headline | Primary Services | Blog Cadence | Proof Elements | Pricing | CTA |
|------------|----------|------------------|--------------|----------------|---------|-----|
| **competitor-a.com** | "Strategic Consulting for Fortune 500 Companies" | Strategy, digital transformation, M&A | 1–2 posts/month | Logos (20+), testimonials, case studies | Not listed | "Schedule consultation" |
| **competitor-b.com** | "Process Optimization and Efficiency Gains" | Process optimization, operations, supply chain | 3–4 posts/month | 3 case studies, ROI calculator | Not listed | "Get free assessment" |
| **competitor-c.com** | "Change Management That Works" | Change management, organizational design | 1 post/month | Team bios, testimonials, white papers | Not listed | "Let's talk" |
| **YOUR SITE** | (TBD — not yet optimized) | Strategic consulting, process optimization, change management | (no blog yet) | (in progress) | Not listed | "Book a call" |

---

## Search Competitor Deep Dive

### Competitor A: competitor-a.com
**Ranking for**: "strategic consulting" (position 4)

**Homepage**:
- Headline: "Strategic Consulting for Fortune 500 Companies"
- Subheadline: "15+ years driving enterprise transformation"
- Hero image: Team in boardroom
- CTA: "Schedule consultation" (blue button, above fold)
- Social proof: "Trusted by 20+ Fortune 500 companies" (with logos)

**Service pages**:
- /services/strategy-transformation
  - Structure: Problem → Solution → ROI → Case studies → CTA
  - CTAs: "Schedule consultation" (top), "Download case study" (middle), "Schedule consultation" (bottom)
  - Proof: 3 case studies with 20–30% ROI claims
  - No pricing listed
- /services/digital-transformation
  - Similar structure
  - Focuses on technology implementation

**Blog**:
- 45 posts total (estimated)
- Recent posts (last 3 months): "5 Reasons Transformation Fails", "The Top 10 Change Leadership Mistakes", "How to Measure Transformation ROI"
- Cadence: ~1–2 posts/month
- Topics: Mostly informational ("how to", "common mistakes", "best practices")
- No clear targeting of commercial ("best consulting firms") queries

**Trust signals**:
- Founder bio: MBA from Harvard, 20+ years at McKinsey
- Team page: 8 consultants with photos and bios
- Client logos: Recognizable Fortune 500 names
- Awards: "Top 100 Consulting Firms" (unnamed award; credibility unclear)

**Assessment**:
- **Strengths**: Strong authority signals (Fortune 500 clients, founder pedigree), frequent CTAs
- **Weaknesses**: Blog under-leveraged (only 1–2 posts/month for 45-post library), no pricing transparency, generic messaging ("transformation", "enterprise")
- **Differentiation opportunity**: More frequent, specific content for smaller mid-market; transparent pricing or ROI guarantees

---

### Competitor B: competitor-b.com
**Ranking for**: "process optimization consulting" (position 2)

**Homepage**:
- Headline: "Process Optimization and Efficiency Gains"
- Subheadline: "Average client ROI: 18–22% within 90 days"
- Hero: Animated dashboard with metrics
- CTA: "Get free assessment" (red button, sticky header)
- Social proof: "Trusted by 200+ mid-market companies" (no logos shown)

**Service pages**:
- /services/process-optimization
  - Structure: Problem → Our approach → ROI breakdown → Assessment CTA
  - Proof: 2 case studies (specific ROI: "18% cost reduction", "24% faster processing")
  - Interactive tool: ROI calculator (estimate your potential savings)
  - Pricing: Not listed; but "Assessment" CTA likely leads to pricing discussion
- /services/lean-six-sigma
  - Similar structure but more technical
  - Mentions certifications and training

**Blog**:
- 120+ posts total
- Recent posts: "How to Calculate Process Efficiency", "Lean vs Six Sigma vs Kaizen", "Supply Chain Bottleneck Analysis"
- Cadence: 3–4 posts/month (high output)
- Topics: Mix of informational and technical (process mapping, metrics, tools)
- Several posts target "best" and "vs" commercial keywords

**Trust signals**:
- Founder: Not highlighted (different positioning than Competitor A)
- Team page: 12 people with titles and LinkedIn links
- Client logos: Mid-market manufacturing and logistics companies
- Certifications: American Society for Quality (ASQ), Six Sigma Black Belt

**Assessment**:
- **Strengths**: Specific ROI claims (18–22%), high-frequency blog (3–4 posts/month), interactive tools, targets mid-market explicitly
- **Weaknesses**: Less Fortune 500 credibility, no prominent awards, fewer case studies than Competitor A
- **Differentiation opportunity**: Match their blog frequency; add your own ROI guarantees or guarantees

---

### Competitor C: competitor-c.com
**Ranking for**: "change management consulting" (position 6)

**Homepage**:
- Headline: "Change Management That Works"
- Subheadline: "80% of our clients report successful adoption within 90 days"
- Hero: Team facilitating workshop
- CTA: "Let's talk" (understated; less prominent)
- Social proof: 3 testimonial quotes (no company names)

**Service pages**:
- /services/change-management
  - Structure: Problem → Methodology (ADKAR model) → Process → Outcomes → CTA
  - Proof: 1 case study (specific: "Reduced resistance from 40% to 12%")
  - Pricing: Starts at "$25K" for small projects
  - CTA: "Schedule discovery call"
- /services/organizational-design
  - Less detailed; fewer case studies

**Blog**:
- 30 posts total
- Recent posts: "Change Leadership Traits", "How to Measure Change Adoption", "Resistance to Change: Root Causes"
- Cadence: ~1 post/month
- Topics: Informational, less commercial keyword focus

**Trust signals**:
- Founder bio: Organization Development professional, certified coach
- Team page: 4 people, brief bios
- Certifications: ICF certified, ADKAR certified
- Testimonials: General praise, but no company names (less credible)

**Assessment**:
- **Strengths**: Only competitor with public pricing ($25K entry point), specific methodology (ADKAR), 80% success rate stat
- **Weaknesses**: Smallest team, fewest case studies, low blog output, weak social proof (no company names)
- **Differentiation opportunity**: Better case studies; more frequent content; stronger proof elements

---

## Positioning Insights (Evidence-Based)

### Insight 1: Competitors Position by Client Size, Not by Outcome
**Evidence:**
- Competitor A: "Fortune 500 Companies"
- Competitor B: "200+ mid-market companies"
- Competitor C: Generic ("Change Management That Works")

**Gap**: No competitor positions explicitly on outcome metrics or guarantees (except Competitor B's 18–22% ROI).

**Opportunity**: "Process Optimization with Guaranteed ROI" or "Strategic Consulting Designed for Mid-Market Growth" — position by outcome, not just client size.

---

### Insight 2: Blog Is Under-Leveraged by Most Competitors
**Evidence:**
- Competitor A: 45 posts total, 1–2/month (blog exists but low frequency)
- Competitor B: 120+ posts, 3–4/month (outlier; strong content strategy)
- Competitor C: 30 posts total, 1/month (minimal)

**Gap**: Only Competitor B is attacking commercial keywords ("best", "vs", "how to choose"). A and C focus on informational only.

**Opportunity**: Publish 2–3 posts/month targeting commercial keywords (comparisons, "best firms", buying guides). Competitors A and C are leaving money on the table.

---

### Insight 3: Proof Elements Are Weak Across the Board
**Evidence:**
- Competitor A: Logos only; no specific case studies on homepage
- Competitor B: 2 case studies; specific ROI claims (strongest)
- Competitor C: 1 case study; testimonials with no company names (weakest credibility)

**Gap**: No competitor has 5+ case studies or transparent client testimonials with names.

**Opportunity**: Build a robust case study library with client names, specific metrics, and before/after comparisons. This will differentiate you significantly.

---

### Insight 4: Most Competitors Use "Let's Talk" or "Schedule Consultation" CTA
**Evidence:**
- Competitor A: "Schedule consultation" (5+ times on homepage and service pages)
- Competitor B: "Get free assessment" (more specific, lower friction)
- Competitor C: "Let's talk" (vague, weak)

**Gap**: No competitor uses outcome-focused CTAs like "Get Your Process Audit" or "Unlock ROI Potential" or "See Your Efficiency Gains".

**Opportunity**: Use specific CTAs that name the outcome. "Get Your Process Audit" or "Book a 30-Minute ROI Assessment" beats generic "Let's talk."

---

### Insight 5: Pricing is a Competitive Vacuum
**Evidence:**
- Competitor A: No pricing listed
- Competitor B: No pricing listed
- Competitor C: "Starts at $25K" (only one with pricing)

**Gap**: Most consulting firms hide pricing; users must call for quotes.

**Opportunity**: If you can, publish transparent pricing or pricing ranges ("$15K–$50K depending on scope"). This will attract price-conscious buyers and reduce qualification friction. Or create a pricing calculator.

---

## Differentiation Strategy

Based on competitor analysis, here's what makes your site unique:

1. **Outcome-First Positioning**
   - Position by guaranteed ROI or specific metrics
   - Example: "18–22% efficiency gain or 100% refund" (stronger than Competitor B's claims)

2. **Proof-Heavy Content**
   - 5–7 case studies (vs competitors' 1–3)
   - Include client names and specific metrics
   - Testimonial videos (none do this)

3. **High-Frequency Blog (3–4 posts/month)**
   - Match Competitor B's cadence
   - Target commercial keywords they ignore ("best", "vs", "how to choose")
   - Capture market share from organic search

4. **Specific CTAs by Service**
   - Not "Schedule consultation" (generic)
   - But "Get Your Process Audit", "Book Strategy Review", "Request ROI Analysis"
   - Each CTA names an outcome

5. **Transparent Pricing or Pricing Calculator**
   - Set yourself apart from competitors who hide pricing
   - Builds trust; attracts serious buyers

6. **Target Mid-Market Explicitly**
   - Competitors A and B both do this; you should too
   - Use case studies of mid-market clients
   - Tailor service descriptions to mid-market pain points

---

## Next Steps

1. **Update positioning**: Align your homepage headline with differentiation strategy (#1 above)
2. **Create case studies**: Target 5 case studies with specific metrics and client names
3. **Blog strategy**: Commit to 3–4 posts/month; target commercial keywords competitors ignore
4. **Review CTAs**: Replace generic CTAs with outcome-focused ones (#4)
5. **Run skills**: 
   - `/seo-titles` to update homepage and service page headlines
   - `/blog-writer` to create 2–3 posts targeting commercial keywords
   - `/keyword-optimize` to audit service pages for keyword alignment

---

## Backlink Analysis (Optional)

*Skipped; no Semrush or Ahrefs API connected. If you add an API key, future runs will include referring domains, link anchor text, and backlink opportunities.*
```

## Approval Gate

**No approval required.** This is a research-only skill. It does not modify the site.

The output is a strategic planning document. User can use insights to:
- Update positioning (via `/seo-titles`)
- Create targeted blog content (via `/blog-writer`)
- Optimize service pages (via `/keyword-optimize`)

## Do Not

- **Do not copy competitor content** — Analyze and learn from their structure; create original content
- **Do not use unverified data** — Only analyze what's publicly visible on their site
- **Do not invent backlink data** — Include backlink analysis only if a data source is connected
- **Do not recommend copying competitor CTAs word-for-word** — Learn from their approach; create your own
- **Do not make subjective judgments without evidence** — Every insight must cite specific competitor data
- **Do not analyze competitors' private pages or tools** — Stay to public-facing content
- **Do not include pricing if it's estimated or behind a form** — Only analyze transparent, published pricing
- **Do not recommend spammy tactics** — If competitors use sketchy SEO, don't recommend copying them
