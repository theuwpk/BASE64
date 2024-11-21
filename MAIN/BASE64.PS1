$output = "BASE64.TXT"

if (Test-Path $output) { Remove-Item $output }

$exeFiles = Get-ChildItem -Filter *.exe

foreach ($exeFile in $exeFiles) {
    if ($exeFile.Name -ne "BASE64.EXE") {
        $exeBytes = [System.IO.File]::ReadAllBytes($exeFile.FullName)
        $base64String = [Convert]::ToBase64String($exeBytes)
        Set-Content -Path $output -Value $base64String -NoNewline
    }
}
