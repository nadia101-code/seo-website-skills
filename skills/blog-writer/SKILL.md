---
name: blog-writer
description: Use when researching, outlining, drafting, and QA-ing blog posts based on search intent and keyword research
---

# Blog Post Research, Outlining, and Drafting

## When to Use

Run this skill when creating new blog content optimized for search. Use it to:
- Research search intent for a target keyword
- Analyze top-ranking content to find structure gaps
- Generate an outline with H1, H2, H3 headings
- Draft original blog content with sourced claims and FAQs
- Humanize the draft (remove AI phrasing, vary sentence length)
- Add title, meta description, image suggestions, and internal links
- QA the draft for unverified facts and broken links

## First Run

On first run, this skill will:
1. Ask you to confirm `site-profile.md` is complete (brand voice, services, target audience)
2. Ask for the target keyword or topic
3. Research search intent using web search for that keyword
4. Analyze top 3–5 results for structure, gaps, and common patterns
5. Generate an outline with H1, H2, H3, and short content notes
6. Present the outline for approval before drafting
7. Draft the post section by section
8. Run humanization pass (remove generic AI phrasing, vary sentences)
9. Add SEO elements: title, meta description, focus keyword, internal links, image suggestions, FAQ
10. QA the draft: flag unverified facts, check links
11. Output the full draft in markdown for review

**Important:** This skill does NOT publish content. Output is a markdown draft for user review.

## Inputs

- **Site profile** (required): Brand voice, services, target audience from `site-profile.md`
- **Target keyword** (required): The primary keyword to target (e.g., "how to reduce customer churn")
- **Tone preference** (optional): Professional, conversational, technical (default: professional)
- **Length target** (optional): 800, 1200, 1500, 2000+ words (default: 1200–1500 words)
- **Internal link targets** (optional): Priority pages to link to (service pages, related posts)

## Steps

### Phase 1: Research and Outline

1. **Research search intent:**
   - Web search for target keyword
   - Review top 3–5 results: note structure, headings, key points
   - Check "People Also Ask" for common questions
   - Check "Related searches" for semantic keywords
   - Note what competitors cover and what they miss
2. **Define search intent:**
   - Informational ("how to"), commercial ("best X for Y"), or transactional ("buy X")
   - Identify user goal (e.g., "learn a process", "compare options", "solve a problem")
3. **Generate outline:**
   - **H1**: Title with target keyword (50–60 characters)
   - **Intro** (100–150 words): Hook, problem statement, promise
   - **H2 sections**: 3–7 main topics (from competitor analysis + gaps)
   - **H3 subsections**: Details under each H2
   - **FAQ section**: 3–5 questions from "People Also Ask" or user intent
   - **Conclusion** (50–100 words): Summary + CTA
4. **Present outline to user:**
   - Show structure with section notes
   - Ask: "Approve this outline, or request changes?"
   - Wait for approval before drafting

### Phase 2: Draft Content

5. **Write intro:**
   - Hook: Specific stat, story, or pain point (no generic openings like "In today's world...")
   - Problem statement: What challenge does the reader face?
   - Promise: What will this post deliver? (Be specific: "3 tactics", "a 5-step process")
   - Include primary keyword naturally in first 100 words
6. **Write H2 sections:**
   - Each H2 = one main idea
   - Use subheadings (H3) for steps, examples, or breakdowns
   - Include secondary keywords naturally where relevant
   - Use bullet points for lists (steps, benefits, features)
   - Cite sources for stats and claims (link to authoritative source or note "[verify with user]")
   - Add examples or case studies (use placeholder if needed: "[Insert client example]")
7. **Write FAQ section:**
   - Answer 3–5 common questions from "People Also Ask" or user intent
   - Each answer: 2–4 sentences
   - Use conversational tone (even on professional sites)
   - Include related keywords naturally
8. **Write conclusion:**
   - Summarize key takeaways (3–5 points)
   - Add CTA: soft ("Learn more about [service]") or direct ("Schedule a consultation")
   - Link to relevant service page or contact page

### Phase 3: Humanize

9. **Humanization pass:**
   - Remove generic AI phrasing:
     - "In today's digital landscape" → cut or replace with specific context
     - "Innovative approach" → replace with specific method or tactic
     - "Cutting-edge solutions" → replace with what it actually is
     - "It's important to note" → cut
     - "As we all know" → cut
   - Vary sentence length:
     - Mix short (5–8 words), medium (12–18 words), long (20+ words)
     - Short sentences for impact; long for explanation
   - Remove hedging:
     - "Could potentially" → "can"
     - "Might possibly" → "may"
     - "Tends to" → "often" or "does"
   - Use active voice: "We analyzed 500 accounts" not "500 accounts were analyzed"
   - Replace clichés: "Think outside the box" → specific action

### Phase 4: SEO and Links

10. **Add SEO elements:**
    - **Title tag** (50–60 characters): Include primary keyword
    - **Meta description** (120–155 characters): Action-oriented, include secondary keyword
    - **Focus keyword**: Primary keyword
    - **Secondary keywords**: 3–5 related terms to include naturally
11. **Add internal links:**
    - Link to 3–5 relevant pages on your site:
      - Service pages (if topic relates to your services)
      - Related blog posts (if they exist)
      - Contact page (in conclusion CTA)
    - Use descriptive anchor text (not "click here")
    - Place links naturally in context
12. **Suggest images:**
    - Hero image (topic-related photo or illustration)
    - 2–4 supporting images (screenshots, diagrams, charts)
    - Provide brief description for each (alt text guidance)

### Phase 5: QA

13. **QA the draft:**
    - **Fact check**: Flag any claims without sources (note "[verify: source needed]")
    - **Link check**: Mark placeholder links (e.g., "[link to case study]")
    - **Keyword check**: Ensure primary keyword in title, intro, H2 (at least one), conclusion
    - **Readability**: Confirm varied sentence length, no generic AI phrasing remains
    - **Uniqueness**: Ensure content is original, not copied from competitors (paraphrase is fine, copying is not)
14. **Output markdown draft** with:
    - SEO metadata at top (title, description, focus keyword)
    - Full post body
    - Internal link suggestions
    - Image suggestions
    - FAQ section
    - Notes for user (unverified facts, placeholder links, additional research needed)

## Checks

Before finalizing draft:
- [ ] Title is 50–60 characters and includes primary keyword
- [ ] Meta description is 120–155 characters
- [ ] Intro includes primary keyword in first 100 words
- [ ] H1 is the title; only one H1
- [ ] H2 and H3 structure is logical (no H3 before H2)
- [ ] 3–5 internal links with descriptive anchor text
- [ ] FAQ section has 3–5 questions answered
- [ ] No generic AI phrasing ("In today's...", "cutting-edge", "innovative")
- [ ] Sentence length varies (short, medium, long mixed)
- [ ] No unsourced claims (or flagged for user to verify)
- [ ] No exact keyword stuffing (1 per 100–150 words)
- [ ] Conclusion has CTA and link to service or contact page
- [ ] Draft is 1200–1500 words (or user's target length)

## Output

**Example draft format:**

```markdown
---
Title: How to Reduce Customer Churn by 22% in 90 Days
Meta Description: Proven tactics to cut customer churn. Data from 500 accounts, 3 steps, real results. Start with onboarding.
Focus Keyword: reduce customer churn
Secondary Keywords: customer retention, onboarding process, churn rate
---

# How to Reduce Customer Churn by 22% in 90 Days

Client churn cost us $200K last year. Our retention rate was 71%. After reworking our onboarding process, it climbed to 93% in 6 months. Here's exactly what changed and how to apply it to your team.

## The Hidden Cost of Poor Onboarding

Most companies track churn. Few realize the root cause sits in the first 14 days. We analyzed 500 customer accounts and found 68% of churned users never completed onboarding.

Why?
- Onboarding emails sent but not read
- Features demonstrated once, never reinforced
- No check-in at day 7 or 30

The fix isn't more content. It's better sequencing.

## Step 1: Map Your Onboarding Journey

Before optimizing, document your current flow.

### What to track:
- Days 1–7: What emails, calls, or tutorials do new users see?
- Days 8–30: What happens after signup?
- Day 30+: When do you ask for feedback?

Use a spreadsheet. [Link to template]. Column 1: Day. Column 2: Touchpoint. Column 3: Goal.

Most teams discover gaps. Common pattern: Day 1 email, then silence until day 15 renewal reminder. That's 14 days of drift.

## Step 2: Add Three High-Impact Touchpoints

You don't need a dozen emails. You need three that land.

### Touchpoint 1: Day 3 – Quick Win Email

Subject: "You're 2 clicks away from [specific outcome]"

Body: One task. One benefit. One link. Example: "Set up your first report in 90 seconds. [Link]. You'll see your top 5 metrics in real time."

**Why day 3?** Users who complete one task by day 3 are 3.2x more likely to stay past 90 days (source: our data set, n=500).

### Touchpoint 2: Day 7 – Personal Check-In

Not automated. A real person. Subject: "How's it going?"

Ask one question: "What's one thing we could make easier?"

**Why this works:** 41% of users reply. Of those, 89% convert to paying customers (vs. 52% who don't receive this email).

### Touchpoint 3: Day 30 – Proof Moment

Show them their own data. Subject: "You saved [X hours] this month"

Body: A chart or stat pulled from their account. "You processed 47 invoices 22% faster than your baseline. Here's the breakdown."

**Why this works:** Proof > promises. Users who see their own results rarely churn.

## Step 3: Measure and Iterate

Track these metrics weekly:
- % of users who complete day 3 task
- % who reply to day 7 check-in
- % who open day 30 proof email

Iterate on the lowest-performing touchpoint first. Example: If day 3 email has 18% open rate, test a new subject line. "2 clicks away" beat "Get started" by 34% in our test.

## FAQ

**How long does it take to see results?**
Most teams see a 10–15% churn reduction within 60 days. Full impact (20%+) takes 90 days because you need a cohort to complete the full onboarding cycle.

**What if users don't open the emails?**
Test subject lines first. If open rates stay below 20%, switch channels. SMS or in-app notifications often outperform email for day 3 and 7 touchpoints.

**Can I automate all three touchpoints?**
Automate day 3 and day 30. Keep day 7 personal (manual or semi-automated with personal sign-off). The human element matters at day 7.

**What if we have a sales-led onboarding process?**
Same principles apply. Sales rep sends day 3 task, schedules day 7 call, sends day 30 proof deck. The touchpoints stay; the channel shifts.

**How do I calculate churn rate?**
(Customers lost in period) ÷ (Customers at start of period) × 100. Example: Lost 10 of 100 → 10% monthly churn rate.

## What Changed for Us

Before: 71% retention, generic onboarding emails, no day 7 check-in.

After: 93% retention, 3-touchpoint sequence, personal day 7 outreach.

Time to implement: 2 weeks. Cost: $0 (used existing email tool). ROI: $200K churn reduction annually.

Your results will vary. The method won't.

---

**Ready to cut churn?** Our team helps B2B SaaS and service companies redesign onboarding for retention. [Schedule a free strategy call](#) or explore our [customer retention consulting services](#).

---

## Internal Link Suggestions

- [Link "customer retention consulting services" to: example.com/services/customer-retention]
- [Link "Schedule a free strategy call" to: example.com/contact]
- [Link "onboarding process" (in intro or H2) to: example.com/blog/onboarding-best-practices] (if this post exists)

## Image Suggestions

1. **Hero image**: Photo or illustration of customer success team working with client data
   - Alt text: "Customer success team analyzing retention data and onboarding metrics"
2. **Touchpoint timeline diagram**: Visual showing day 1, 3, 7, 30 milestones
   - Alt text: "Onboarding timeline with key touchpoints at days 3, 7, and 30"
3. **Before/after chart**: 71% vs 93% retention
   - Alt text: "Retention rate improvement from 71% to 93% after onboarding redesign"
4. **Screenshot**: Example of day 3 email
   - Alt text: "Sample day 3 onboarding email with single task and clear call-to-action"

## Notes for Review

- [Verify: "3.2x more likely to stay past 90 days" — source is internal data; confirm this stat before publishing]
- [Verify: "41% of users reply" — from our test; replace with your own data if different]
- [Link: "Link to template" — create or link to your own spreadsheet template]
- All other stats (71% → 93%, $200K, 500 accounts) are from the intro example; replace with your real numbers if different

---

**Word count**: ~1,280 words
**Readability**: Flesch Reading Ease ~65 (Plain English)
**Keyword density**: "reduce customer churn" appears 4x (~0.3%); "retention" appears 8x (~0.6%)
```

## Approval Gate

**Changes require explicit approval. Draft is NOT published automatically.**

After generating the draft:
1. Present the full draft above
2. Ask: "Review this draft. Reply 'approve to publish', 'revise [section] because [reason]', or 'start over with different angle'."
3. Wait for user response
4. If revisions requested, show updated sections side-by-side (current vs revised)
5. Once approved, user publishes manually OR skill can push draft to WordPress (if connector available)

## Do Not

- **Do not publish automatically** — Draft is for review; user controls when it goes live
- **Do not copy competitor content** — Paraphrase and add original insights; never lift entire paragraphs
- **Do not make up stats** — If you don't have data, write "[verify with user]" or use generic framing ("many companies find...")
- **Do not promise rankings** — SEO-optimized ≠ guaranteed ranking
- **Do not skip humanization pass** — Generic AI phrasing undermines credibility
- **Do not add fake sources** — If you don't have a source, flag it; don't invent one
- **Do not keyword-stuff** — Natural placement only; target is 1 keyword per 100–150 words
- **Do not write click-bait titles** — "This ONE WEIRD TRICK" is not professional
- **Do not ignore brand voice** — Casual brands can be playful; B2B brands stay professional
- **Do not skip the FAQ** — Search engines love FAQ schema; include 3–5 questions
