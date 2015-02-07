$packageName = '{{PackageName}}'

try {
    #evince doesn't have an uninstaller. didn't know how to handle it otherwise
    $app = Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -match "evince"}
    $app.Uninstall()
    } catch {
    throw $_.Exception 
    }
