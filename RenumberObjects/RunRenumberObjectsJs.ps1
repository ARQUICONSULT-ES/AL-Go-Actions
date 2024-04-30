Param(
    [Parameter(HelpMessage = "The Path Project", Mandatory = $false)]
    [string] $project = ""
)

$projectPath = $null

$baseFolder = $ENV:GITHUB_WORKSPACE
$projectPath = Join-Path $baseFolder $project

Write-Host "::group::Rename All Objects Id"
Write-Host "Script path: $PSScriptRoot"
Write-Host "Project path: $projectPath"
Write-Host $projectPath
# Rename All Objects Id
$RenameAllObjectsPath = (Join-Path -Path $PSScriptRoot -ChildPath "..\RenumberObjects\renumberObjects.js" -Resolve)
Write-Host "Translation script path: $RenameAllObjectsPath"
Write-Host "Renamed all fields..."
& 'C:\Program Files\nodejs\node.exe' $RenameAllObjectsPath $projectPath
Write-Host "::endgroup::"