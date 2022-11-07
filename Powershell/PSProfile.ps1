
function Edit-Profile { code $PROFILE }
function dev { Set-Location D:\Development }
function gs { git status }
function checkout { git checkout $args }
function commit { git commit -m $args }
function pull { git pull }
function push { git push }

function pva { venv/Scripts/activate.ps1 }

function prompt {
    Write-Host -NoNewline -ForegroundColor Blue "$(Get-Location)>"
    return " "
}

Clear-Host

Write-Host "$($MyInvocation.MyCommand.Path) loaded." -ForegroundColor Green
