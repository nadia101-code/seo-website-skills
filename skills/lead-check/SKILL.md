---
name: lead-check
description: Use when verifying contact forms, call buttons, WhatsApp links, and CTAs across all pages
---

# Lead Generation and Conversion Path Check

## When to Use

Run this skill after launching a new site, after redesigning conversion paths, or monthly as part of routine maintenance. Use it to:
- Verify contact forms are present and visible on key pages
- Check that phone and WhatsApp links work and use correct numbers
- Confirm CTAs match brand voice and are clickable
- Find broken links to contact pages or forms
- Ensure mobile users can easily contact you

## First Run

On first run, this skill will:
1. Ask you to confirm `site-profile.md` has phone, email, WhatsApp, and CTA text filled in
2. Fetch your sitemap and identify key conversion pages (homepage, services, contact, blog)
3. Check each page for contact forms, call buttons, WhatsApp links, and CTAs
4. Test links to contact page and form URLs
5. Output a pass/fail report with severity (critical, high, medium, low)
6. Provide a daily manual checklist for form submission testing

**Note:** This skill cannot submit live forms or verify email delivery. Those must be tested manually by the user.

## Inputs

- **Site profile** (required): Phone, WhatsApp, email, contact form URL, primary CTA text
- **Target pages** (optional): Specific URLs to check; if omitted, checks homepage, all service pages, blog hub, and contact page
- **Device** (optional): Desktop or mobile viewport; default is mobile (where contact issues are most common)

## Steps

1. **Load site profile** and extract:
   - Phone number (international format, e.g., `+1-555-0123`)
   - WhatsApp number (same format)
   - Email address
   - Contact form URL
   - Primary CTA text
2. **Fetch sitemap** and identify conversion pages:
   - Homepage
   - Service/product pages (from `site-profile.md` or inferred from URL patterns like `/services/`, `/products/`)
   - Blog hub or blog posts (top 5 by traffic if available)
   - Contact page
3. **For each page, check:**
   - **Contact form present**: Look for `<form>` tag with email or message fields
   - **Form visible on mobile**: Check if form is above fold or within first scroll (using viewport height)
   - **Call button**: Look for `<a href="tel:` link with correct phone number
   - **WhatsApp button**: Look for `<a href="https://wa.me/` or `https://api.whatsapp.com/send` with correct number and prefilled text
   - **CTA text**: Verify primary CTA appears on page and matches brand CTA from site-profile
   - **Contact link in menu**: Check main navigation for link to contact page
   - **Broken links**: Test that contact form URL, email `mailto:` links, and phone links are not 404
4. **Mobile-specific checks:**
   - Phone and WhatsApp links are `<a>` tags, not plain text (plain text can't be tapped)
   - Form fields are large enough to tap (minimum 44x44px touch target)
   - CTA buttons are styled and visible (not hidden by hero image or footer)
5. **Mark each item as:**
   - **Pass**: Present, correct, and functional
   - **Fail**: Missing, incorrect, or broken
   - **Severity**:
     - **Critical**: Contact form missing on contact page, phone number incorrect, broken contact page link
     - **High**: Call button missing on service pages, WhatsApp link incorrect, CTA not visible on mobile
     - **Medium**: Contact link missing from menu, form not visible on mobile, CTA text doesn't match brand
     - **Low**: Decorative issues (button styling, label text)

## Checks

Before finalizing report:
- [ ] Phone number format is consistent with site-profile (international format)
- [ ] WhatsApp link includes country code and uses `wa.me` or `api.whatsapp.com` domain
- [ ] Email `mailto:` links match site-profile email exactly
- [ ] Contact form URL is live (200 status code)
- [ ] CTA text matches brand CTA from site-profile
- [ ] All pages checked are actually in sitemap or user-provided list

## Output

A markdown report organized by severity, then by page:

```markdown
# Lead Check Report

**Site**: example.com
**Date**: 2026-10-16
**Pages checked**: 8
**Critical issues**: 1
**High issues**: 2
**Medium issues**: 3
**Low issues**: 0

---

## Critical Issues

### Contact Page: Contact form missing
- **URL**: example.com/contact
- **Issue**: No `<form>` element found on page
- **Impact**: Users cannot submit inquiries
- **Fix**: Add contact form via theme or plugin (e.g., Contact Form 7, Gravity Forms)
- **Verify**: Load page, fill out form, submit, check email inbox

---

## High Issues

### Homepage: Call button missing
- **URL**: example.com
- **Issue**: No `<a href="tel:">` link found
- **Impact**: Mobile users cannot tap to call
- **Fix**: Add call button in hero or header with `<a href="tel:+15550123">Call Us</a>`
- **Verify**: Open page on mobile, tap button, confirm dialer opens with correct number

### Service Page: WhatsApp link incorrect
- **URL**: example.com/services/consulting
- **Issue**: WhatsApp link uses `+1555-0123` (no country code separator)
- **Expected**: `https://wa.me/15550123`
- **Impact**: Link may not work on all devices
- **Fix**: Update link to `https://wa.me/15550123?text=Hi, I'm interested in consulting`
- **Verify**: Tap link on mobile, confirm WhatsApp opens with prefilled message

---

## Medium Issues

### Blog Hub: Contact link missing from menu
- **URL**: example.com/blog
- **Issue**: Main navigation does not include link to contact page
- **Impact**: Users must scroll to footer or use back button to find contact
- **Fix**: Add "Contact" link to main menu
- **Verify**: Check menu on desktop and mobile

### Homepage: Form not visible on mobile
- **URL**: example.com
- **Issue**: Contact form is below fold (requires 3+ scrolls to reach)
- **Impact**: Mobile users may not see form
- **Fix**: Move form higher on page or add "Get in touch" CTA button above fold that scrolls to form
- **Verify**: Open page on mobile, check if form or CTA is visible without scrolling

### Service Page: CTA text doesn't match brand
- **URL**: example.com/services/consulting
- **Current CTA**: "Contact us"
- **Expected CTA**: "Schedule a free strategy call" (from site-profile)
- **Impact**: Weaker conversion signal
- **Fix**: Update button text to match brand CTA
- **Verify**: Reload page, confirm button text updated

---

## Pass (No Issues)

- Homepage: WhatsApp button ✓
- Contact page: Email link ✓
- Contact page: Phone link ✓
- Service page: Contact form ✓
- Blog post: CTA visible ✓

---

## Daily Manual Checklist

This skill cannot submit forms or test email delivery. Run these checks manually:

- [ ] Submit contact form with test data → verify email arrives in inbox
- [ ] Check spam folder for form submissions
- [ ] Tap call button on mobile → verify dialer opens with correct number
- [ ] Tap WhatsApp button on mobile → verify WhatsApp opens with prefilled text
- [ ] Click email link → verify mail client opens with correct address

**Recommended frequency**: Weekly for high-traffic sites, monthly for low-traffic sites.
```

## Approval Gate

**No approval required.** This is an audit-only skill. It does not modify the site.

However, if the user asks to fix issues automatically, show the proposed changes (exact HTML for call/WhatsApp buttons, CTA text, menu links) and wait for approval before applying.

## Do Not

- **Do not submit live contact forms** — Form submission testing must be done manually by the user
- **Do not assume form delivery works** — A form on the page doesn't mean emails arrive; user must verify
- **Do not flag decorative issues as critical** — Button color or icon style is low priority; missing buttons are high priority
- **Do not recommend third-party tools without user request** — Suggest standard plugins (Contact Form 7, Gravity Forms) only when form is missing
- **Do not check pages outside the sitemap** — Unless user provides a specific URL list
- **Do not mark "WhatsApp missing" as critical** — Not every business uses WhatsApp; check site-profile first
- **Do not rewrite CTA text without approval** — CTA wording is a brand decision
