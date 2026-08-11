#Requires -Version 5.1
<#
.SYNOPSIS
  Проверка перед push на GitHub: нет ли проприетарных файлов в индексе git.
#>
param(
    [switch]$Strict
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '.')).Path

$forbiddenPatterns = @(
    'launcher_gui\.py$',
    'talon\.py$',
    'talon_backup\.py$',
    'server_bot\.py$',
    'test_proxy\.py$',
    'bot_b64\.txt$',
    '^tools/',
    '^tests/',
    '\.env$',
    '\.env\.',
    '^config/',
    'license_manager\.py$',
    'generate_license\.py$',
    'digiseller_license_server\.py$',
    'napriem_api\.py$',
    '\.bat$',
    '^dist/',
    '^venv/',
    '^\.idea/',
    '^\.gigaide/',
    '\.iml$',
    'requirements\.txt$',
    'Dockerfile$',
    'docker-compose\.yml$',
    'docs/BUYER_GUIDE\.md$',
    'docs/LICENSE_SELLER\.md$',
    'docs/SALES\.md$',
    '^[^/]+\.py$'
)

$forbiddenFiles = @(
    'docs/PUBLISH_CHECKLIST.md'
)

function Test-ForbiddenPath {
    param([string]$RelativePath)
    $normalized = ($RelativePath -replace '\\', '/').TrimStart('./')
    foreach ($pattern in $forbiddenPatterns) {
        if ($normalized -match $pattern) {
            return $true
        }
    }
    foreach ($file in $forbiddenFiles) {
        if ($normalized -eq $file) {
            return $true
        }
    }
    return $false
}

Write-Host 'TalonBot — verify showcase repo before push' -ForegroundColor Cyan
Write-Host "Root: $root"
Write-Host ''

$issues = @()

if (-not (Test-Path (Join-Path $root '.git'))) {
    Write-Host '[INFO] Git not initialized yet. Checking filesystem for accidental exposure...' -ForegroundColor Yellow
    $wouldPublish = @(
        'README.md',
        'LICENSE',
        'docs/ARCHITECTURE.md',
        'assets/talonbot.png',
        'assets/talonbot.ico',
        'verify_before_push.ps1'
    )
    foreach ($rel in $wouldPublish) {
        $full = Join-Path $root ($rel -replace '/', '\')
        if (-not (Test-Path $full)) {
            $issues += "Missing showcase file: $rel"
        }
    }
}
else {
    Push-Location $root
    try {
        $tracked = git ls-files 2>$null
        if (-not $tracked) {
            Write-Host '[INFO] No tracked files yet. Run git add . and re-check.' -ForegroundColor Yellow
        }
        else {
            foreach ($path in $tracked) {
                if (Test-ForbiddenPath $path) {
                    $issues += "TRACKED FORBIDDEN: $path"
                }
            }
        }

        $staged = git diff --cached --name-only 2>$null
        foreach ($path in $staged) {
            if (Test-ForbiddenPath $path) {
                $issues += "STAGED FORBIDDEN: $path"
            }
        }
    }
    finally {
        Pop-Location
    }
}

Write-Host 'Expected public files:'
@(
    'README.md',
    'LICENSE',
    'docs/ARCHITECTURE.md',
    'docs/screenshots/',
    'assets/talonbot.png',
    'verify_before_push.ps1',
    '.gitignore'
) | ForEach-Object { Write-Host "  + $_" -ForegroundColor DarkGreen }

Write-Host ''
if ($issues.Count -eq 0) {
    Write-Host 'OK — no forbidden files detected.' -ForegroundColor Green
    exit 0
}

Write-Host "FAILED — $($issues.Count) issue(s):" -ForegroundColor Red
$issues | ForEach-Object { Write-Host "  ! $_" -ForegroundColor Red }
Write-Host ''
Write-Host 'Fix: update .gitignore, then git rm --cached <file>' -ForegroundColor Yellow
exit 1
