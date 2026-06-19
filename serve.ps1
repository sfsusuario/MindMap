$port = 3333
$url  = "http://localhost:$port"
$dir  = $PSScriptRoot

$python = Get-Command python -ErrorAction SilentlyContinue
$node   = Get-Command node   -ErrorAction SilentlyContinue

if (-not $python -and -not $node) {
    Write-Error "No se encontro Python ni Node.js. Instala uno de los dos."
    exit 1
}

Write-Host ""
Write-Host "  MindMap - servidor local" -ForegroundColor Cyan
Write-Host "  $url"                     -ForegroundColor Green
Write-Host "  Ctrl+C para detener`n"   -ForegroundColor DarkGray

# Abre el navegador un segundo despues de levantar el servidor
Start-Job -ScriptBlock { param($u); Start-Sleep 1; Start-Process $u } -ArgumentList $url | Out-Null

if ($python) {
    Write-Host "  Python: $((python --version 2>&1))`n" -ForegroundColor DarkGray
    python -m http.server $port --directory $dir
}
else {
    Write-Host "  Node.js`n" -ForegroundColor DarkGray

    # Single-quoted here-string: PowerShell NO interpreta nada dentro.
    # Los marcadores ROOTDIR y PORT se reemplazan luego con .Replace().
    $nodeCode = @'
const http = require('http');
const fs   = require('fs');
const path = require('path');
const root = 'ROOTDIR';
const mime = {
  '.html': 'text/html',
  '.md':   'text/markdown',
  '.js':   'text/javascript',
  '.css':  'text/css'
};
http.createServer((req, res) => {
  const rel  = req.url === '/' ? 'index.html' : req.url.split('?')[0];
  const file = path.join(root, rel);
  fs.readFile(file, (err, data) => {
    if (err) { res.writeHead(404); res.end('Not found'); return; }
    res.writeHead(200, { 'Content-Type': mime[path.extname(file)] || 'text/plain' });
    res.end(data);
  });
}).listen(PORT, () => console.log('  Servidor listo'));
'@

    $safeDir  = $dir -replace '\\', '/'
    $nodeCode = $nodeCode.Replace('ROOTDIR', $safeDir).Replace('PORT', [string]$port)

    $tmp = Join-Path $env:TEMP 'mindmap_serve.js'
    Set-Content -Path $tmp -Value $nodeCode -Encoding utf8
    try   { node $tmp }
    finally { Remove-Item $tmp -ErrorAction SilentlyContinue }
}
