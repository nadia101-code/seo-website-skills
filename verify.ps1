#!/usr/bin/env pwsh
# Verification script for SEO Website Skills Bundle

Write-Host "=== SEO Website Skills Bundle Verification ===" -ForegroundColor Cyan
Write-Host ""

$errors = @()
$warnings = @()

# Check directory structure
Write-Host "Checking directory structure..." -ForegroundColor Yellow

$requiredDirs = @(
    "skills",
    "skills/seo-titles",
    "skills/lead-check",
    "skills/noindex-review",
    "skills/keyword-optimize",
    "skills/internal-links",
    "skills/image-alt-text",
    "skills/blog-writer",
    "skills/search-console-monthly",
    "skills/keyword-research",
    "skills/competitor-analysis",
    "skills/site-structure",
    "skills/site-audit",
    "docs",
    "references"
)

foreach ($dir in $requiredDirs) {
    if (-not (Test-Path $dir)) {
        $errors += "Missing directory: $dir"
    }
    else {
        Write-Host "  ✓ $dir" -ForegroundColor Green
    }
}

# Check required files
Write-Host ""
Write-Host "Checking required files..." -ForegroundColor Yellow

$requiredFiles = @(
    "README.md",
    "site-profile.md",
    "docs/getting-started.md",
    "references/voice-rules.md"
)

foreach ($file in $requiredFiles) {
    if (-not (Test-Path $file)) {
        $errors += "Missing file: $file"
    }
    else {
        Write-Host "  ✓ $file" -ForegroundColor Green
    }
}

# Check each skill has SKILL.md
Write-Host ""
Write-Host "Checking skill files..." -ForegroundColor Yellow

$skills = @(
    "seo-titles",
    "lead-check",
    "noindex-review",
    "keyword-optimize",
    "internal-links",
    "image-alt-text",
    "blog-writer",
    "search-console-monthly",
    "keyword-research",
    "competitor-analysis",
    "site-structure",
    "site-audit"
)

foreach ($skill in $skills) {
    $skillPath = "skills/$skill/SKILL.md"
    if (-not (Test-Path $skillPath)) {
        $errors += "Missing skill file: $skillPath"
    }
    else {
        Write-Host "  ✓ $skillPath" -ForegroundColor Green
    }
}

# Print summary
Write-Host ""
Write-Host "=== Verification Summary ===" -ForegroundColor Cyan
Write-Host ""

if ($errors.Count -eq 0) {
    Write-Host "✓ All structural checks passed!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Bundle structure is complete and valid." -ForegroundColor Green
    exit 0
}
else {
    Write-Host "❌ ERRORS ($($errors.Count)):" -ForegroundColor Red
    foreach ($error in $errors) {
        Write-Host "  • $error" -ForegroundColor Red
    }
    exit 1
}
