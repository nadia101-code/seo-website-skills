---
name: image-alt-text
description: Use when writing descriptive alt text for all images based on context and visual content
---

# Image Alt Text Optimization

## When to Use

Run this skill after a site audit or when launching new pages with images. Use it to:
- Write descriptive alt text for all meaningful images
- Mark decorative images with empty alt (`alt=""`)
- Ensure alt text is unique across the site
- Improve accessibility for screen readers
- Add keywords naturally where relevant

## First Run

On first run, this skill will:
1. Ask you to confirm `site-profile.md` is complete (site name, brand voice)
2. Fetch your sitemap and crawl all pages
3. Extract all images (`<img>` tags) and their current alt text
4. Categorize images: meaningful (photos, diagrams, screenshots) vs decorative (spacers, icons, dividers)
5. For meaningful images:
   - View the image (if accessible)
   - Read surrounding text and page context
   - Check filename for hints
   - Write alt text of 5–15 words
   - Include keyword only if accurate for that image
6. For decorative images: mark as empty alt (`alt=""`)
7. Output a CSV with image URL, current alt, proposed alt, and reason
8. Wait for approval before applying changes

## Inputs

- **Site profile** (required): Site name, brand voice from `site-profile.md`
- **Target pages** (optional): Specific URLs to check; if omitted, all pages in sitemap are included
- **Image descriptions** (optional): If images are not publicly accessible, user can provide descriptions

## Steps

1. **Load site profile** for brand voice and keyword guidance
2. **Fetch all pages** in sitemap and extract images:
   - Image URL (`src` attribute)
   - Filename (e.g., "consulting-team.jpg")
   - Current alt text (if any)
   - Image dimensions
   - Surrounding text (caption, paragraph)
3. **Categorize each image:**
   - **Meaningful**: Photos of people/products, diagrams, screenshots, charts, logos, hero images
   - **Decorative**: Spacers, dividers, icons (if context already explains them), background images
4. **For meaningful images:**
   - Examine the image (fetch and analyze)
   - Read surrounding text and page heading
   - Determine what the image shows and why it's on the page
   - Check if filename suggests keywords (e.g., "manufacturing-process.jpg")
   - Write alt text:
     - 5–15 words
     - Describe what you see, not "image of" or "picture"
     - Include one keyword naturally if relevant (e.g., "Team of strategic consultants in meeting" includes "strategic")
     - Unique per image (not repeated)
     - Active voice where possible
5. **For decorative images:**
   - Mark as `alt=""` (empty, no alt text)
   - Example: spacers, dividers, background patterns, icon bullets
6. **For logos:**
   - Alt text = brand name (e.g., "Acme Consulting logo")
   - On homepage/header: may be empty if brand name is in text
7. **Check:**
   - No duplicate alt text across site
   - Every meaningful image has alt text
   - No keyword stuffing (1 keyword per image max)
   - Alt text reads naturally, not robotic
8. **Output CSV** with columns:
   - `image_url`: URL of image
   - `page`: URL of page containing image
   - `current_alt`: Existing alt text (if any)
   - `proposed_alt`: New alt text
   - `image_type`: Meaningful or Decorative
   - `keyword_included`: The keyword (if any)
   - `reason`: Why this alt text

## Checks

Before finalizing proposals:
- [ ] Every meaningful image has 5–15 word alt text
- [ ] Every decorative image has empty alt (`alt=""`)
- [ ] No duplicate alt text across the site
- [ ] No alt text contains "image", "picture", "photo" (describes the medium, not content)
- [ ] No alt text starts with "Image of" or "Picture of"
- [ ] Brand voice is maintained (tone matches site-profile)
- [ ] Keywords included are accurate for the image (not forced)
- [ ] Logos have brand name as alt
- [ ] No keyword stuffing (1 keyword per image, not multiple)

## Output

**Example alt text proposals:**

```csv
image_url,page,current_alt,proposed_alt,image_type,keyword_included,reason
example.com/wp-content/uploads/consulting-team.jpg,example.com/about,team photo,Strategic consultants in client strategy meeting,Meaningful,strategic consulting,Hero image on About page; includes keyword naturally
example.com/wp-content/uploads/case-study-chart.png,example.com/blog/case-study,chart,Efficiency gains over 90 days: baseline 71% to post-implementation 93%,Meaningful,,Diagram showing before/after; specific data describes chart
example.com/wp-content/uploads/logo.png,example.com,Example logo,Acme Consulting,Meaningful,,Brand logo in header
example.com/wp-content/uploads/spacer.gif,example.com/services,spacer image,empty,Decorative,,Non-content spacer div
example.com/wp-content/uploads/divider.png,example.com/blog,divider,empty,Decorative,,Decorative line between sections
```

**Markdown report:**

```markdown
# Image Alt Text Analysis

**Site**: example.com
**Date**: 2026-10-16
**Pages checked**: 18
**Images found**: 34
**With alt text**: 8
**Missing alt text**: 18
**Decorative (empty alt)**: 8

---

## By Severity

### Critical
- 0 images on money pages (homepage, service pages) missing alt text

### High
- 3 images on blog posts missing alt text

### Medium
- 15 images across resource pages, about page missing alt text

---

## Proposed Alt Text (Sample - First 10 Images)

### Meaningful Images

#### 1. Homepage Hero
- **Image**: example.com/wp-content/uploads/hero-consulting.jpg
- **Page**: example.com
- **Current**: (empty)
- **Proposed**: "Mid-market manufacturing director leading strategic planning session"
- **Keywords**: None (hero context already set by H1)
- **Word count**: 11
- **Reason**: Hero image shows leadership and strategic work; alt text describes scene without keyword stuffing

#### 2. About Page Team Photo
- **Image**: example.com/wp-content/uploads/team-photo.jpg
- **Page**: example.com/about
- **Current**: "Our team"
- **Proposed**: "Strategic consulting team reviewing process optimization framework with client"
- **Keywords**: process optimization
- **Word count**: 12
- **Reason**: Photo shows team at work; includes "process optimization" naturally (relevant to their work)

#### 3. Blog Post: Case Study Chart
- **Image**: example.com/wp-content/uploads/case-study-efficiency-chart.png
- **Page**: example.com/blog/case-study-manufacturing
- **Current**: (empty)
- **Proposed**: "Efficiency gains from 71% to 93% over 90 days after process optimization implementation"
- **Keywords**: process optimization
- **Word count**: 15
- **Reason**: Chart shows key metric; alt text conveys the data for screen readers

#### 4. Service Page: Process Icon
- **Image**: example.com/wp-content/uploads/icon-process.svg
- **Page**: example.com/services/process-optimization
- **Current**: "icon"
- **Proposed**: (empty - decorative bullet icon, context provided by heading "Our Process")
- **Keywords**: None
- **Word count**: 0
- **Reason**: Icon is purely decorative; adjacent heading "Our Process" provides context

#### 5. Blog Post: Screenshot
- **Image**: example.com/wp-content/uploads/spreadsheet-example.png
- **Page**: example.com/blog/how-to-reduce-churn
- **Current**: (empty)
- **Proposed**: "Spreadsheet template for tracking customer engagement and churn risk signals"
- **Keywords**: customer engagement, churn
- **Word count**: 12
- **Reason**: Screenshot is instructional; alt text describes what users see and its purpose

---

## Decorative Images (Empty Alt)

These will have `alt=""`:

- Spacer dividers: 8 instances across pages
- Background patterns: 2 instances
- Icon bullets (context provided by text): 6 instances
- Repeated decorative lines: 4 instances

**Total decorative**: 20 images with `alt=""`

---

## Best Practices Applied

1. ✓ No "Image of" or "Picture of" prefixes
2. ✓ Active voice: "Director leading..." not "A director is being led..."
3. ✓ Keywords included only where accurate and natural
4. ✓ Unique alt text per image (no repeats)
5. ✓ 5–15 word range maintained
6. ✓ Describes content, not medium (no "photo" or "screenshot" in alt)
7. ✓ Brand voice reflected (professional, specific)

---

## How to Apply Changes

After approval, alt text will be updated in:

1. **WordPress**: Edit each image in media library or inline
2. **Shopify**: Update image alt field in product/page editor
3. **Manual CMS**: Export, update alt in `<img>` tags, reupload
4. **Static site**: Update alt in HTML source files

Each change will show current vs proposed side-by-side.
```

## Approval Gate

**Changes require explicit approval.**

After generating the report:
1. Present critical and high-priority images first (on money pages, blog posts)
2. Show sample of 5–10 proposed alt texts with reasons
3. Ask: "Review these proposals. Reply 'approve all', 'approve only [list images]', or 'revise [image] because [reason]'."
4. Wait for user response
5. If approved, apply changes via:
   - **WordPress**: Update in Media Library or inline image editor
   - **Shopify**: Update alt field in product/page editor
   - **Manual**: Export HTML, update `alt=""` attributes, reupload
6. After applying, provide verification checklist

## Verification Steps

After changes are applied:
1. Visit 3–5 pages with updated alt text
2. Inspect images in browser (right-click → Inspect, check `alt` attribute)
3. Use a screen reader (NVDA, JAWS, or macOS VoiceOver) to test that alt text reads naturally
4. Run accessibility checker (WAVE, axe DevTools) to confirm no alt text errors
5. For images on blog posts, check that alt text doesn't appear as on-page text (it shouldn't)

Provide these as a checklist for the user.

## Do Not

- **Do not add "image", "picture", "photo" to alt text** — Alt text describes content, not the medium
- **Do not repeat the same alt text on multiple images** — Unique per image
- **Do not stuff keywords** — One keyword per image at most; only if natural
- **Do not write alt text for decorative images** — Spacers, dividers, bullets should have empty alt (`alt=""`)
- **Do not use alt text to replace image captions** — Alt is for screen readers; captions are for visual users. Both can exist.
- **Do not write robotic alt text** — "Team photo of people" → "Strategic consultants collaborating in meeting" is better
- **Do not add alt text to background images** — CSS backgrounds are decorative by default
- **Do not ignore brand voice** — Alt text should match your site's tone (professional, friendly, casual, etc.)
- **Do not apply changes without approval** — Always show current vs proposed and wait for confirmation
