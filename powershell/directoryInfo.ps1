#This script Shows Directory informations

Write-Host "Enter the directory locaton:"
$directory=Read-Host #get directory location
#directory size calculating functions
function Get-DirectorySize() {
  param ([string]$root = $(resolve-path .))
  gci -re $root |
    ?{ -not $_.PSIsContainer } | 
    measure-object -sum -property Length
}
#end function
$files = get-childitem -Path $directory -recurse  
$folders = $files | where-object { $_.PSIsContainer } #get total sub folders

$files = Get-ChildItem $directory -Recurse | Where-Object {!$_.PSIsContainer} | Measure-Object #get total fiels


$ts=(Get-DirectorySize $directory).Sum
$totalsize =[math]::Round($($ts / 1Mb), 2)

Write-Host "Total subFolders:" $folders.Count
Write-Host "Total Files:" $files.Count
Write-Host "Total Size:" $totalsize "MB"

Read-Host "Press any key to continue.........."