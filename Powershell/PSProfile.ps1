
$userProfile = $MyInvocation.MyCommand.Path
function Edit-Profile { code $userProfile }

function gstatus { git status $args }
function gdiff { git diff --color-words $args }
function gclone { git clone $args }
function gcheckout { git checkout $args }
function gadd { git add $args }
function greset { git reset $args }
function gcommit { git commit -m $($args -join ' ') }
function gpull { git pull }
function gpush { git push }
function gprune { git remote prune origin }


$parent = $userProfile
while ($true) {    
    $parent = $(Split-Path -Path $parent -Parent)
    Write-Host $parent
    if (Test-Path "$parent/.git") {
        $parent = $(Split-Path -Path $parent -Parent)
        $env:DEV = $parent
        Remove-Variable parent
        break
    }
}
Clear-Host

function cdev { Set-Location $env:DEV }
function cdtools { Set-Location "$($env:DEV)/tools" }
function cdmai { Set-Location "$($env:DEV)/mai" }
function cddevproj { Set-Location "$($env:DEV)/mai/dev-project" }
function cdmaster { Set-Location "$($env:DEV)/mai/master-thesis" }
function cdsem3 { Set-Location "$($env:DEV)/mai/subjects/Semester3" }

function exp { explorer.exe . }

function prompt {
    Write-Host -NoNewline -ForegroundColor Blue "$(Get-Location)>"
    return " "
}

if(Test-Path "venv") {
    Write-Host "Activating venv"
    
    function pva { venv/Scripts/activate.ps1 }
    pva
}


# Write-Host "$($MyInvocation.MyCommand.Path) loaded." -ForegroundColor Green
