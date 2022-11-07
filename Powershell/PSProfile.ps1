
$userProfile = $MyInvocation.MyCommand.Path
function Edit-Profile { code $userProfile }

function gstatus { git status }
function gdiff { git diff --color-words }
function gclone { git clone $args }
function gcheckout { git checkout $args }
function gadd { git add $args }
function greset { git reset $args }
function gcommit { git commit -m $args }
function gpull { git pull }
function gpush { git push }


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

function cdev { Set-Location $env:DEV }

function pva { venv/Scripts/activate.ps1 }

function prompt {
    Write-Host -NoNewline -ForegroundColor Blue "$(Get-Location)>"
    return " "
}

Clear-Host

# Write-Host "$($MyInvocation.MyCommand.Path) loaded." -ForegroundColor Green
