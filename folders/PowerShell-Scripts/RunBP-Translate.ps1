#Srtarts BP-Translate using admin credentials
Start-Process -FilePath "C:\BP-translatelnk.exe.lnk" -ErrorAction Stop

$filePath = "C:\BP-Translate\files\gamelauncher.txt"

#checks to find gamelauncher file path
if (-not(Test-path $FilePath -PathType leaf)) {

    #Required to know the path location of where BandaiNamco is installed
    Add-Type -AssemblyName Microsoft.VisualBasic

    $gamelauncher = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the path to the BandaiNamcoLauncher exe file, an example is: C:\Program Files (x86)\BandaiNamcoLauncher\Launcher\Launcher", "Input")

timeout /t 3

        if ($gamelauncher -eq "") {

            $gamelauncher = "C:\Program Files (x86)\BandaiNamcoLauncher\Launcher\Launcher"

        } else {

            Write-Output "You entered: $myString"

    }

#Save variable to text file
$gamelauncher | Out-File -FilePath "C:\BP-Translate\files\gamelauncher.txt"
   

} else {
    
    Write-Output "Your file path is: " $gamelauncher

}

Start-Sleep -s 5

Write-Output "Game Launcher file" $gamelauncher


#Check if gamelauncher text file exists, if it does stores the path into a variable
$gamelauncher = Get-Content -Path "C:\BP-Translate\files\gamelauncher.txt"


#variable to store the path to the launcher
$gameStart = $gamelauncher + "\BandaiNamcoLauncher.exe"

Write-Output "Game Start path" + $gameStart

Start-Sleep -s 3

#Starts the Bandai Namco Launcher
Start-Process -FilePath $gameStart  -ErrorAction Stop

#Output
Write-Warning "Application started"

#Wait 30 seconds for the Bandai Namco Launcher to load before moving to the next commands
Start-Sleep -s 25

#Output
Write-Warning "Starting Blue Protocol"


# import mouse_event and SetCursorPos
Add-Type -MemberDefinition '[DllImport("user32.dll")] public static extern void mouse_event(int flags, int dx, int dy, int cButtons, int info); [DllImport("user32.dll")] public static extern bool SetCursorPos(int x, int y);' -Name U32_2 -Namespace W;

# center the mouse cursor
[W.U32_2]::mouse_event(0x8000, 0.5*65535, 0.5*65535, 0, 0);

#Wait 10 seconds
Start-Sleep -s 10

# set new cursor position for a display using 1920 x 1080
$newX = 1439
$newY = 820
[W.U32_2]::SetCursorPos($newX, $newY)

#wait 2 seconds
Start-Sleep -s 2

# left mouse click
[W.U32_2]::mouse_event(6,0,0,0,0);

#Wait 30 seconds
Start-Sleep -s 30

