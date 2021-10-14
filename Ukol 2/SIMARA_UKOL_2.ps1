$DOWNLOADS = "C:\Users\" + $env:username + "\Downloads"
$DOCUMENTS = "C:\Users\" + $env:username + "\Documents"
$PICTURES = "C:\Users\" + $env:username + "\Pictures"
cd $DOWNLOADS
Get-ChildItem | Where CreationTime -lt (Get-Date).AddDays(-7) | Remove-Item -Force
cd $DOCUMENTS
get-childitem *.jpg, *.png | foreach-object {move-item $_ -destination $PICTURES}
Get-ChildItem | Where Length -gt 5000000 | Remove-Item -Force
Write-Host "DONE"