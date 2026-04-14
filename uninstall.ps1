# uninstall.ps1

Write-Host ""
Write-Host "🧹 Uninstalling pip-analyzer..." -ForegroundColor Yellow

$installDir = "$env:LOCALAPPDATA\pip-analyzer"

# Remover pasta
if (Test-Path $installDir) {
    Remove-Item $installDir -Recurse -Force
    Write-Host "✅ Removed installation directory" -ForegroundColor Green
}

# Remover do PATH
$currentPath = [Environment]::GetEnvironmentVariable("PATH", "User")

$newPath = ($currentPath -split ";") | Where-Object { $_ -ne $installDir }
$newPath = ($newPath -join ";")

[Environment]::SetEnvironmentVariable("PATH", $newPath, "User")

Write-Host "✅ Removed from PATH" -ForegroundColor Green

Write-Host ""
Write-Host "🎯 Uninstall complete" -ForegroundColor Green
Write-Host ""