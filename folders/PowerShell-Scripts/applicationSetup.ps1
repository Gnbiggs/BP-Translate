#Copy the shortcut file to the C drive
Try {
$sourceFile = "C:\BP-Translate\folders\BP-translatelnk.exe.lnk"
$destinationFolder = "C:\"
$destinationFile = Join-Path $destinationFolder (Split-Path $sourceFile -Leaf)

if (!(Test-Path $destinationFile)) {
    Copy-Item $sourceFile $destinationFolder
}
} catch {

    Write-Warning "Copying BP-Translate shortcut to C Drive"
}

Start-Sleep -s 2

#Install certificate
Import-PfxCertificate -FilePath "C:\BP-Translate\folders\BP-translate\bpmasterdata.pfx" -CertStoreLocation "Cert:\LocalMachine\Root"

Start-Sleep -s 2

#Required to know the games path location
Add-Type -AssemblyName Microsoft.VisualBasic

$gamelauncher = [Microsoft.VisualBasic.Interaction]::InputBox("Enter BandiNamcoLauncherGames folder location or press enter for default location", "Input")

timeout /t 6

if ($gamelauncher -eq "") {

    $gamelauncher = "C:\BandaiNamcoLauncherGames"

} else {

    Write-Output "You entered: $myString"

}

#Copy the BP-Translator folder to the C:\BandaiNamcoLauncherGames
try {
$sourceFolder = "C:\BP-Translate\folders\BP-translate"
$destinationFolder = $gamelauncher + "\BP-translate"

if (!(Test-Path $destinationFolder)) {
    Copy-Item $sourceFolder $destinationFolder -Recurse
}
} catch {

    Write-Warning "Copying BP-Translate folder into BandaiNamcoLauncherGame folder"
}

Start-Sleep -s 2

#Copy dinput8 DLL file to Blue Protocol folder
try {
$sourceFile = "C:\BP-Translate\folders\En-en\dinput8.dll"
$destinationFolder = $gamelauncher + "\BLUEPROTOCOL\BLUEPROTOCOL\Binaries\Win64"
$destinationFile = Join-Path $destinationFolder (Split-Path $sourceFile -Leaf)

if (!(Test-Path $destinationFile)) {
    Copy-Item $sourceFile $destinationFolder
}
} catch {

    Write-Warning "Copying dinput file into Win64"
}

Start-Sleep -s 2

#Copy Mods folder to Blue Protocol folder
try {
$sourceFolder = "C:\BP-Translate\folders\En-en\~mods"
$destinationFolder = $gamelauncher + "\BLUEPROTOCOL\BLUEPROTOCOL\Content\Paks\~mods"

if (!(Test-Path $destinationFolder)) {
    Copy-Item $sourceFolder $destinationFolder -Recurse
}
} catch {

    Write-Warning "Copying mods folder to PAKs folder"
}


Start-Sleep -s 2
