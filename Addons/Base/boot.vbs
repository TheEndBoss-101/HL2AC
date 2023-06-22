
Dim WshShell
Set WshShell = CreateObject("WScript.Shell")

Dim gameStatusCode
gameStatusCode = 1

Dim launchOptions, additionalLaunchOptions, userLaunchOptions
launchOptions = ""
additionalLaunchOptions = "-condebug -conclearlog"
userLaunchOptions = ""

Sub DoLaunchOptions_old()
Dim gameValue, heapsizeValue
        gameValue = ""
        heapsizeValue = ""

        gameValue = InputBox("Enter the game folder (default: hl2mp):", "Game Selection", "hl2mp")
        launchOptions = "-game " & gameValue & " "
        heapsizeValue = InputBox("Enter the heapsize (default: 512000):", "Heap Size Selection", "512000")
        launchOptions = launchOptions & "-heapsize " & heapsizeValue & " "

        If MsgBox("Do you want it to be windowed?", vbQuestion + vbYesNo + vbDefaultButton2, "Windowed?") = vbYes Then
            Dim widthValue, heightValue
            widthValue = ""
            heightValue = ""

            launchOptions = launchOptions & "-sw "

            widthValue = InputBox("Enter the width (default: 1360):", "width Selection", "1360")
            launchOptions = launchOptions & "-width " & widthValue & " "
            heightValue = InputBox("Enter the height (default: 768):", "height Selection", "768")
            launchOptions = launchOptions & "-height " & heightValue & " "
        End If

        If MsgBox("Enable AC", vbQuestion + vbYesNo + vbDefaultButton2, "AC?") = vbYes Then
            launchOptions = launchOptions & "-ac "
        End If

        If MsgBox("Enable english", vbQuestion + vbYesNo + vbDefaultButton2, "english?") = vbYes Then
            launchOptions = launchOptions & "-english "
        End If
End Sub

Sub DoLaunchOptions()
    launchOptions = ""
    If MsgBox("Do you want to enable Advanced Startup?", vbQuestion + vbYesNo + vbDefaultButton2, "Advanced Startup?") = vbYes Then
        launchOptions = launchOptions & additionalLaunchOptions
        userLaunchOptions = InputBox("Enter additional Launch Options", "User Launch", "-sw -game hl2mp -heapsize 512000 -width 1360 -height 768 -ac -english ")
        launchOptions = launchOptions & userLaunchOptions
    Else
        launchOptions = "-sw "
        launchOptions = launchOptions & "-game hl2mp "
        launchOptions = launchOptions & "-heapsize 512000 "
        launchOptions = launchOptions & "-width 1360 "
        launchOptions = launchOptions & "-height 768 "
        launchOptions = launchOptions & "-ac "
        launchOptions = launchOptions & "-english "
        launchOptions = launchOptions & additionalLaunchOptions
    End If
End Sub

Sub ExitMessage()
    If gameStatusCode <> 0 Then
        If MsgBox("hl2.exe crashed with exit code: " & gameStatusCode, vbCritical + vbRetryCancel + vbDefaultButton2, "Crash Detected!") = vbRetry Then
            If MsgBox("Do you want to configure launch Options?", vbQuestion + vbYesNo + vbDefaultButton2, "Configure launchOptions") = vbYes Then
                Call DoLaunchOptions()
            End If
            Call RunGame()
        End If
    End If
End SUb

Sub RunGame()
    MsgBox("hl2.exe " & launchOptions)
    gameStatusCode = WshShell.Run("hl2.exe " & launchOptions & "", 1, true)
    Call ExitMessage()
End Sub

Call DoLaunchOptions()
Call RunGame()
