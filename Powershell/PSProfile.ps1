
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

# function prompt {
#     Write-Host -NoNewline -ForegroundColor Blue "$(Get-Location)>"
#     return " "
# }

function pva { venv/Scripts/activate.ps1 }

function Add-Path($Path) {
    $env:Path += [IO.Path]::PathSeparator + $Path
}

Add-Path "$env:DEV\tools\Handle"

$env:VIRTUAL_ENV_DISABLE_PROMPT = 1

# Write-Host "$($MyInvocation.MyCommand.Path) loaded." -ForegroundColor Green

# https://learn.microsoft.com/en-us/windows/terminal/tutorials/custom-prompt-setup
# Themes https://ohmyposh.dev/docs/themes

# https://github.com/ryanoasis/nerd-fonts
#.\install.ps1 -WindowsCompatibleOnly CascadiaCode

oh-my-posh init pwsh --config "$($env:DEV)\tools\Powershell\OhMyPosh\powerlevel10k_rainbow.omp.json" | Invoke-Expression

