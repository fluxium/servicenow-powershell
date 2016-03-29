$UserModuleHome = "$env:USERPROFILE\Documents\WindowsPowerShell\Modules"
$ModuleName = "PSServiceNow"

$DeployPath = "$UserModuleHome\$ModuleName"

if (Test-Path $DeployPath)
{
    $Response = Read-Host "Uninstall PSServiceNow Module?"
}
else
{
    $Response = Read-Host "Install PSServiceNow Module?"
}




# Create users PowerShell Modules directory and subfolder for module
New-Item -Type Directory -Path $UserModuleHome -Force | Out-Null
New-Item -Type Directory -Path $UserModuleHome\$ModuleName -Force | Out-Null

# Update this variable with any new file names
$deployFiles = "PSServiceNow-Changes.psm1",                                                                                                             
               "PSServiceNow-ConfigurationManagement.psm1 ",                                                                                          
               "PSServiceNow-Incidents.psm1",                                                                                                          
               "PSServiceNow-Tables.psm1",                                                                                                            
               "PSServiceNow-Users.psm1",                                                                                                                                                                                                                      
               "PSServiceNow.psd1",                                                                                                                    
               "PSServiceNow.psm1",
               "PSServiceNow.format.ps1xml"
    

foreach ($deployFile in $deployFiles)
{
    Copy-Item -Path .\$deployFile -Destination $UserModuleHome\$ModuleName -Force
}

#Remove-Item -Path $UserModuleHome\PSServiceNow -Force