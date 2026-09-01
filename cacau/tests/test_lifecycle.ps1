# Encoding: UTF-8; Windows PowerShell 5.1 reads this file with -Encoding UTF8.
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$skill = Get-Content -Raw (Join-Path $repo 'cacau\SKILL.md')
$readme = Get-Content -Raw (Join-Path $repo 'README.md')
$site = Get-Content -Raw (Join-Path $repo 'docs\index.html')
$changelog = Get-Content -Raw (Join-Path $repo 'CHANGELOG.md')

function Assert-Contains {
    param([string]$Text, [string]$Pattern, [string]$Message)
    if ($Text -notmatch $Pattern) { throw $Message }
}

Assert-Contains $skill 'completed.*historico.*nao precisa.*interrupt' 'SKILL não preserva completed como histórico.'
Assert-Contains $skill 'running.*pending_init.*perdeu o objetivo.*orfao.*objetivo terminou.*interromp' 'SKILL não cobre os estados ativos sem objetivo.'
Assert-Contains $skill 'Wait timed out.*nao interrompa' 'SKILL trata Wait timed out como interrupção.'
Assert-Contains $skill 'inspecione uma vez' 'SKILL não limita a inspeção do lifecycle.'
Assert-Contains $readme 'Versão pública: \*\*1\.1\.0\*\*' 'README sem versão pública 1.1.0.'
Assert-Contains $site 'skill-version" content="1\.1\.0' 'site sem metadata técnica de versão.'
Assert-Contains $changelog '\[1\.1\.0\]' 'CHANGELOG sem 1.1.0.'

Write-Output 'PASS test_lifecycle.ps1'
