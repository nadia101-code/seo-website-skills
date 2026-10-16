# Getting Started with SEO Website Skills

This guide walks a first-time user through setup and your first audit.

## Step 1: Set Up Connections

Before running any skill, connect your data sources. This takes about 10 minutes.

### Google Search Console (Required)

Search Console shows which queries bring traffic to your site, impressions, clicks, and indexing status.

**How to set up:**

1. Go to [Google Search Console](https://search.google.com/search-console)
2. Select your property (your domain)
3. In the left menu, go to **Settings** > **Owners**
4. Copy your **property URL** (e.g., `https://search.google.com/search-console?resource_id=sc-domain%3Aexample.com`)
5. In your `site-profile.md`, paste this URL in the **Google Search Console property URL** field

The skill `search-console-monthly` and others will use this to pull your performance data.

### PageSpeed Insights (Recommended)

PageSpeed shows Core Web Vitals, mobile and desktop performance scores, and optimization suggestions.

**How to set up:**

1. Go to [PageSpeed Insights](https://pagespeed.web.dev/)
2. Enter your homepage URL
3. Note your **mobile and desktop scores** (0–100)
4. The skill `site-audit` will use this data automatically

### Windsor.ai Connector (Optional but Powerful)

If you have a Windsor.ai account, you can connect Search Console and PageSpeed directly so skills pull live data.

**How to set up:**

1. In Claude, type `/config` and open **Connections** or **Connectors**
2. Find **Windsor.ai** and click **Connect**
3. Sign in with your Windsor.ai account
4. Grant permissions for **Google Search Console** and **Google PageSpeed**
5. Return to Claude; the connector is now active

If you skip this, skills will ask you to paste Search Console data or PageSpeed scores manually. That's fine — it just takes a few more seconds per skill.

## Step 2: Fill Out Your Site Profile

Open `site-profile.md` and fill in every field. Skills depend on this information and will stop if critical fields are empty.

**What you need:**

- Site name, URL, business type
- Your phone, email, contact form URL
- Target countries and languages
- Your brand voice (3 adjectives, words to avoid)
- Primary CTA text (e.g., "Book a consultation")
- How your site is edited (WordPress, Shopify, manual, etc.)

**Takes:** 5–10 minutes

**Example:** The template includes a completed example at the bottom.

## Step 3: Run Your First Audit

Start with **site-audit**. This is a full technical, on-page, indexing, and performance scan.

**How to run:**

1. Open Claude and type `/site-audit`
2. Claude will ask you to confirm your `site-profile.md` is filled out
3. Claude fetches data from Search Console and PageSpeed (if connected)
4. You get a report organized by priority: critical issues first

**What it covers:**

- Status codes (404, redirects, etc.)
- Broken links
- Missing titles, meta descriptions, H1 tags
- Mobile usability
- Core Web Vitals
- Image optimization
- Indexing coverage from Search Console

**Takes:** 5–15 minutes depending on site size

**Output:** A detailed report in markdown. Each issue has:
- What it is
- Why it matters for SEO
- Step-by-step fix
- How to verify it's fixed

## Step 4: Read a Report

After a skill runs, you'll see a report. Here's how to read it.

### Structure

Reports are organized by priority:
- **Critical** — fixes that block crawling or indexing (e.g., 404s, noindex on money pages)
- **High** — fixes that impact rankings (e.g., missing titles, thin content)
- **Medium** — improvements that help but aren't urgent (e.g., image optimization)
- **Low** — nice-to-haves (e.g., schema markup on non-core pages)

### Evidence

Every finding includes **evidence** — a source that proves the issue exists:

- A URL that has the problem
- A screenshot or quote from the page
- A Search Console query or data point
- A tool output (PageSpeed, link checker, etc.)

**Do not trust a finding without evidence.** If a skill suggests a change but doesn't cite where it came from, ask for clarification.

### CSV or Table Output

Some skills produce structured output (CSV or markdown table) so you can:
- Filter by priority or status
- Track progress as you fix items
- Share results with your team
- Bulk-edit in your CMS

## Step 5: Approval Gates — How Changes Happen

Some skills propose changes (new titles, internal links, alt text). **Changes never happen automatically.**

### The Approval Workflow

1. **Skill runs** and produces a report with "current" vs "proposed" side-by-side
2. **You review** — read the evidence and the changes. Ask questions if something doesn't make sense
3. **You approve** — say "yes, apply these" or "no, don't" or "apply only X, Y, and Z"
4. **Claude applies** — the changes go to your site through the editing method you chose (WordPress, Shopify, manual export, etc.)
5. **You verify** — check the site to confirm the change worked

### Example

**Skill:** seo-titles

**Report:**
```
URL: example.com/services/consulting
Current title: Consulting Services | Example
Proposed title: Strategic Business Consulting | Example Co.
Current description: We offer consulting services.
Proposed description: Expert strategic consulting for mid-market manufacturing. Process-driven, results-focused.

Evidence: This page ranks for "strategic consulting" (12 impressions, 0 clicks in last 28 days). Title is generic; proposed title includes the primary keyword and brand name.
```

**Your decision:**
- "Yes, apply both" → Claude updates title and description in your CMS
- "Apply title only, skip description" → Only the title changes
- "No, rewrite the title differently" → Claude revises and shows you again
- "I'll do this manually" → Claude shows the exact text; you paste it yourself

## Step 6: Common Workflows

### New Site Audit

1. Run **site-audit** (get baseline)
2. Run **noindex-review** (fix indexing issues)
3. Run **seo-titles** (optimize metadata)
4. Run **lead-check** (verify conversion paths)
5. Run **keyword-research** (build keyword map)
6. Run **keyword-optimize** for priority pages

**Time:** 1–2 hours for a 20-page site

### Monthly SEO Check-In

1. Run **search-console-monthly** (performance report)
2. Review winners and decliners
3. Run **keyword-optimize** for pages that lost clicks
4. Run **blog-writer** for a new post on a high-intent keyword
5. Run **internal-links** to strengthen related pages

**Time:** 30–45 minutes

### Before a Major Website Redesign

1. Run **site-structure** (audit current URL structure)
2. Run **internal-links** (find all inbound links to pages that will move)
3. Generate 301 redirects from site-structure output
4. After redesign, run **site-audit** again to verify nothing broke

**Time:** 1–2 hours

## Step 7: When a Skill Asks for More Info

Some skills may ask:

- **"Can you paste your Search Console data?"** — Open Search Console, navigate to **Performance**, select **last 28 days**, and copy/paste the table. Or connect Windsor.ai so it's automatic.
- **"Which page should I optimize?"** — Provide a URL from your site-profile or a page you want to rank for a specific keyword.
- **"What's your target keyword?"** — Give it a keyword your site should rank for. For example: "strategic consulting for manufacturers" or "buy organic coffee online".

If a skill is stuck, provide the missing info and it will continue.

## Limitations & What Skills Can't Do

- **No scheduled runs** — Skills run manually each time you type a command. Set a reminder in your calendar for monthly audits.
- **No ranking guarantees** — SEO takes time. Skills follow best practices but results depend on competition, content quality, and backlinks.
- **No live form testing** — Skills can check if a form is present, but you must test form submission and email delivery yourself.
- **No backlink data without API** — Competitor backlink analysis requires Semrush or Ahrefs API key.
- **No AI content detection** — Skills write human-quality content but do not claim to beat AI detectors. Focus on good writing, not detector evasion.

## Troubleshooting

**"Site-profile fields are empty"**
→ Go back to Step 2 and fill out `site-profile.md`. Every field is required.

**"Search Console data not loading"**
→ Check that your Search Console property URL is correct in `site-profile.md`. If you don't have it, open Search Console, select your property, and find the URL in the browser address bar.

**"I don't have a CTA text or contact number"**
→ Skills still work. Provide what you have. Lead-check will note what's missing on your site.

**"A skill suggests something that doesn't make sense"**
→ Ask Claude to explain the finding. Every suggestion should cite evidence. If there's no evidence, ask for it.

**"Can I run multiple skills at once?"**
→ Yes, but run them one at a time in Claude for clearer output. Running 5 skills in parallel may make reports hard to read.

## Next Steps

1. Set up your connections (Search Console, PageSpeed)
2. Fill `site-profile.md`
3. Type `/site-audit` and review the report
4. Follow the recommendations in priority order
5. Run `/search-console-monthly` every 28 days to track progress

Questions? Refer to the skill descriptions in [README.md](../README.md) or ask Claude for clarification on any finding.
