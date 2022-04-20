Write-Warning "THIS SCRIPT IS NOT COMPLETE AND MAY NOT WORK.  PLEASE USE AT YOUR OWN RISK."
Write-Warning "THIS SREIPT FOR EDUCATIONAL PURPOSES ONLY.  DO NOT USE FOR ILLEGAL PURPOSES."
Write-Warning "THIS SCRIPT IS PROVIDED AS IS WITHOUT WARRANTY OR GUARANTEE OF ANY KIND."

$p = Invoke-Expression 'python -V'


if ($p.StartsWith('Python 3.10'))
{
    $py = 'python'
}
else
{
    Write-Output 'Python 3.10 or later is required to run this script'
    exit 1
}

# check if there are venv's in the current directory
$venvs = (Get-ChildItem -Path . -Filter '*.venv' -Recurse).Count
if ($venvs -eq 0)
{
    $Venv = '-m', 'venv', 'venv'
    & $py @Venv
}



$p = 'venv\Scripts\python.exe'

$Venv = '-m', 'pip', 'install', '-r', 'requirements.txt'

Clear-Host

& $p @Venv
Clear-Host
 
& $p 'main.py'