
$thisFile = $MyInvocation.MyCommand.Path
function Edit-Profile { code $thisFile }

function gstatus { git status }
function gdiff { git diff --color-words }
function gclone { git clone $args }
function gcheckout { git checkout $args }
function gadd { git add $args }
function greset { git reset $args }
function gcommit { git commit -m $args }
function gpull { git pull }
function gpush { git push }

function pva { venv/Scripts/activate.ps1 }

function prompt {
    Write-Host -NoNewline -ForegroundColor Blue "$(Get-Location)>"
    return " "
}

Clear-Host

# Write-Host "$($MyInvocation.MyCommand.Path) loaded." -ForegroundColor Green
