# Prompt
# Install-Module posh-git -Scope CurrentUser -Force
# Install-Module oh-my-posh -Scope CurrentUser -Force
Import-Module posh-git
Import-Module oh-my-posh

# Icons
# Install-Module -Name Terminal-Icons -Repository PSGallery -Force
Import-Module Terminal-Icons

# z
# Install-Module -Name z -Force
Import-Module Z

# PSReadLine
# Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
Import-Module PSReadLine
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord "Ctrl+d" -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView

# scoop install fzf
# Install-Module -Name PSFzf -Scope CurrentUser -Force
Import-Module PSFzf
Set-PSFzfOption -PSReadLineChordProvider "Ctrl+f" -PSReadLineChordReverseHistory "Ctrl+r"

# Theme
# create on ~/.config/powershell nova.omp.json file
# add inside theme settings
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) "tiwahu.omp.json"
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
# issues: add alias for hidden files
Set-Alias vi nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig "C:\Program Files\Git\usr\bin\tig.exe"
Set-Alias less "C:\Program Files\Git\usr\bin\less.exe"
