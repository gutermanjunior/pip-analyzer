# install.ps1

Write-Host ""
Write-Host "📦 Installing pip-analyzer..." -ForegroundColor Cyan

$installDir = "$env:LOCALAPPDATA\pip-analyzer"

# Criar diretório
New-Item -ItemType Directory -Force -Path $installDir | Out-Null

# Copiar arquivos
Copy-Item ".\pip-analyze.ps1" $installDir -Force
Copy-Item ".\pip-analyze.cmd" $installDir -Force

# Atualizar PATH (User)
$currentPath = [Environment]::GetEnvironmentVariable("PATH", "User")

if ($currentPath -notlike "*$installDir*") {
    [Environment]::SetEnvironmentVariable(
        "PATH",
        "$currentPath;$installDir",
        "User"
    )

    Write-Host "✅ Added pip-analyzer to PATH" -ForegroundColor Green
}
else {
    Write-Host "ℹ️ pip-analyzer already in PATH" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "🎉 Installation complete!" -ForegroundColor Green
Write-Host "👉 Restart your terminal and run: pip-analyze" -ForegroundColor Cyan
Write-Host ""