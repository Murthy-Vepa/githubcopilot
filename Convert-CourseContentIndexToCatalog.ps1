[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string]$InputPath = (Join-Path $PSScriptRoot 'course-content-index.json'),

    [Parameter(Position = 1)]
    [string]$OutputPath = (Join-Path $PSScriptRoot 'course-catalog.js')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Resolve-InputPath {
    param([string]$Path)

    if ([System.IO.Path]::IsPathRooted($Path)) {
        return $Path
    }

    return Join-Path (Get-Location) $Path
}

$resolvedInputPath = Resolve-InputPath $InputPath
$resolvedOutputPath = Resolve-InputPath $OutputPath

if (-not (Test-Path -LiteralPath $resolvedInputPath -PathType Leaf)) {
    throw "Input file was not found: $resolvedInputPath"
}

$index = Get-Content -LiteralPath $resolvedInputPath -Raw | ConvertFrom-Json

$categories = foreach ($category in $index.categories) {
    $categoryProperties = [ordered]@{}

    foreach ($property in $category.PSObject.Properties) {
        if ($property.Name -ne 'tags') {
            $categoryProperties[$property.Name] = $property.Value
        }
    }

    [pscustomobject]$categoryProperties
}

$catalog = [ordered]@{
    categories = @($categories)
    resourceFormats = @($index.resourceFormats | Where-Object { $_.active -eq $true })
    resources = @($index.resources | Where-Object { $_.active -eq $true })
}

$json = $catalog | ConvertTo-Json -Depth 100
$output = "window.courseCatalog = $json;"
$encoding = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($resolvedOutputPath, $output, $encoding)

Write-Output "Generated $resolvedOutputPath from $resolvedInputPath"