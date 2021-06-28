#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <MsgBoxConstants.au3>
#include <GUIConstantsEx.au3>
#include <Word.au3>
#include <Date.au3>
#include <Excel.au3>

;browser
Local $sChrome="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
Local $sFirefox="C:\Program Files (x86)\Mozilla Firefox\firefox.exe"
Local $sOpera="C:\Users\Administrator\AppData\Local\Programs\Opera\launcher.exe"
Local $sEdge_Shortcut=""

;work around
Local $sUrlInternetLogin="http://10.10.10.18:90/p/cdbdd4a09a64909694281aec503746fd/index.html?aGFvLjE2OXguY24v"
Local $sUrlGerit="http://review.sh-stt.com/login/q/status:open,n,z"
Local $sUrlJenkins="http://192.168.1.131:8080/ "
Local $sUrlRdms="http://192.168.0.224:8080/login.jsp"
Local $sUrlTestlink="http://192.168.1.247/testlink/login.php"
Local $sUrlMantis="http://192.168.1.247/mantisbt/"

Local $sUrlBing="http://www.bing.com/"

;application under test

Local $sUrlPomp208User="http://192.168.1.208/pomp/user/tologin.do"
Local $sUrlPomp208Sso="http://192.168.1.208/pomp/sso/tologin.do"
Local $sUrlPomp204User="http://192.168.1.204/pomp/user/tologin.do"
Local $sUrlPompLabsUser="https://labs.sh-stt.com/pomp/user/login.do"
Local $sUrlPompResUser="https://117.136.190.188/user/tologin.do"
Local $sUrlPompResSso="https://117.136.190.188/login/index.html"

Local $sUrlMCMS200="https://192.168.1.200/mcms/user/login.do"
Local $sUrlMcms216="http://192.168.0.216:8080/user/login.do"

Local $sUrlEuopResUser="https://117.136.190.189:8443/user/tologin.do"
Local $sUrlEuopLabsUser="http://180.169.129.54:8888/euop/user/tologin.do"
Local $sUrlEuop181User="http://192.168.1.181:8080/euop/login/index2.html"
Local $sUrlEuop175User="http://192.168.1.175:8099/euop/user/login.do"

Local $sUserName="zhangjh@sh-stt.com"
Local $sPhone="15800407048"

;申请权限时的默认理由
Local $sDefaultReason = "由于一级手厅新增位置对接联调，需要dev账号权限查看应用和接口机日志"


Opt("GUIOnEventMode",1)

Local $hMainGUI = GUICreate("Start work", 600,400)
GUISetOnEvent($GUI_EVENT_CLOSE,"CLOSEButton")
GUICtrlCreateLabel("Start the env", 30,10)
Local $iStartWorkButton = GUICtrlCreateButton("Start ENV", 30,40,100)
Local $iStartFirefoxDefaultButton = GUICtrlCreateButton("Firefox default", 30, 80, 100)
Local $iStartChromeDefaultButton = GUICtrlCreateButton("Chrome default", 30, 120, 100)
Local $iStartEdgeDefaultButton = GUICtrlCreateButton("Edge default", 30, 160, 100)
Local $iStartOperaDefaultButton = GUICtrlCreateButton("Opera default", 30,200, 100)
Local $iStartIeDefaultButton = GUICtrlCreateButton("Ie default", 30, 240, 100)



GUICtrlCreateLabel("Pomp", 200,10)
Local $iPomp204Button = GUICtrlCreateButton("Pomp204", 200, 40, 60)
Local $iPomp208Button = GUICtrlCreateButton("Pomp208", 200, 80, 60)
Local $iPompLabsButton = GUICtrlCreateButton("PompLabs", 200, 120, 60)
Local $iPompResButton = GUICtrlCreateButton("PompRes", 200, 160, 60)


GUICtrlCreateLabel("Euop", 300,10)
Local $iEuop181Button = GUICtrlCreateButton("Euop181",300, 40, 60)
Local $iEuop181TestButton = GUICtrlCreateButton("T",360,40,20)
Local $iEuop175Button = GUICtrlCreateButton("Euop175",300, 80, 60)
Local $iEuopLabsButton = GUICtrlCreateButton("EuopLabs", 300, 120, 60)
Local $iEuopResButton = GUICtrlCreateButton("EuopRes", 300, 160, 60)

GUICtrlCreateLabel("Auto word", 400,10)
Local $iWordAutoButton = GUICtrlCreateButton("普通账号申请", 400, 40, 180)
Local $iOvernightAutoButton = GUICtrlCreateButton("非工作时间普通账号申请", 400, 80, 180)

;buttons with functions
GUICtrlSetOnEvent($iStartWorkButton,"Start_work")
GUICtrlSetOnEvent($iEuopResButton, "Euop_Res")
GUICtrlSetOnEvent($iEuopLabsButton,"Euop_Labs")
GUICtrlSetOnEvent($iEuop181Button, "Euop_181")
GUICtrlSetOnEvent($iEuop181TestButton,"Euop_181_test")
GUICtrlSetOnEvent($iEuop175Button, "Euop_175")

GUICtrlSetOnEvent($iPompResButton, "Pomp_Res")
GUICtrlSetOnEvent($iPompLabsButton,"Pomp_Labs")
GUICtrlSetOnEvent($iPomp208Button, "Pomp_208")
GUICtrlSetOnEvent($iPomp204Button,"Pomp_204")

GUICtrlSetOnEvent($iStartFirefoxDefaultButton, "Firefox_Default")
GUICtrlSetOnEvent($iStartChromeDefaultButton, "Chrome_Default")
GUICtrlSetOnEvent($iStartOperaDefaultButton,"Opera_Default");
GUICtrlSetOnEvent($iStartEdgeDefaultButton, "Edge_Default")

GUICtrlSetOnEvent($iWordAutoButton, "Word_Auto_Dev")
GUICtrlSetOnEvent($iOvernightAutoButton, "Overnight_Auto_Dev")

GUISetState(@SW_SHOW,$hMainGUI)

While 1
    Sleep(100)
WEnd

Func CLOSEButton()
    ;MsgBox($MB_OK, "GUI Event", "Closing")
    Exit
EndFunc ;==>CLOSEButton


Func Start_work()
    ;上班后启动工作环境
    ;登录联网许可，打开chrome，点击确定
    run($sChrome  & " " &    $sUrlGerit  & " " & $sUrlJenkins  & " " & $sUrlRdms  & " " & $sUrlTestlink  & " " & $sUrlMantis)
    Local $hWinChrome = WinWaitActive("[TITLE:Gerrit Code Review - Sign In - Google Chrome;INSTANCE:1]","");



   send("^1");gerit
    sleep(1*1000)


    send("^2") ;jenkins
    sleep(1*1000)


    send("^3") ;rdms
    sleep(1*1000)

    ;mouseclick("left",1010,642,1); 确认登录 RDMS

    send("^4") ; Testlink
    sleep(1*1000)


    send("^5") ; mantis
    sleep(1*1000)


EndFunc ;==>Start_work

Func Pomp_208()

   run($sFirefox & " -no-remote -profile firefox_profiles/Pomp_208 " & $sUrlPomp208User)

   Local $hWinFirefox = WinWaitActive("[管理员登录 — Mozilla Firefox;CLASS:MozillaWindowClass]","")
   Local $hWin = WinWaitActive("[管理员登录 — Mozilla Firefox]","")
   Sleep(3000)
   Send("{TAB}")
   Send($sUserName)
   Send("{TAB}")
   Send($sPhone)
   Send("{TAB}")
   Send("1")


EndFunc ;Pomp_208

Func Pomp_204()
   Local $sUserNamePomp204 = 'zhangjh@sh-stt.com';
   Local $sPhonePomp204="15800407048"

   run($sFirefox & " -no-remote -profile firefox_profiles/Pomp_204 " & $sUrlPomp204User)

   Local $hWinFirefox = WinWaitActive("[管理员登录 — Mozilla Firefox;CLASS:MozillaWindowClass]","")
   Local $hWin = WinWaitActive("[管理员登录 — Mozilla Firefox]","")
   Sleep(3000)
   Send("{TAB}")
   Send($sUserNamePomp204)
   Send("{TAB}")
   Send($sPhonePomp204)
   Send("{TAB}")
   Send("")


EndFunc ;Pomp_204


Func Pomp_Labs()
   Local $sUserNamePompLabs = "zhangjunhua@sh";
   Local $sPhonePompLabs = "15800407048";
   run($sFirefox & " -no-remote -profile firefox_profiles/Pomp_Labs " & $sUrlPompLabsUser)

   Local $hWinFirefox = WinWaitActive("[管理员登录 — Mozilla Firefox;CLASS:MozillaWindowClass]","")
   Sleep(3000)
   Send("{TAB}")
   Send($sUserNamePompLabs)
   Send("{TAB}")
   Send($sPhonePompLabs)
   Send("{TAB}")
   Send("")

EndFunc ;Pomp_Labs

Func Pomp_Res()
    ;pomp 生产环境使用sso登录方式，禁用user方式了
   Local $sUserNamePompRes="qc_zhangjh"
   Local $sPassWord=""
   Local $sPhonePompRes="15800407048"
   run($sFirefox & " -no-remote -profile firefox_profiles/Pomp_Res " & $sUrlPompResSso)

   Local $hWinFirefox = WinWaitActive("[管理员登录 — Mozilla Firefox;CLASS:MozillaWindowClass]","")
   Sleep(3000)
   ;Send("{TAB}")
   Send($sUserNamePompRes)
   Send("{TAB}")
   Send($sPassWord)
   ;Send("{TAB}")
   ;Send("")

EndFunc ;Pomp_Res


Func Euop_Res()
   Run($sFirefox & " -no-remote -profile firefox_profiles/Euop_Res " & $sUrlEuopResUser)
   Local $hWin = WinWaitActive("[TITLE:管理员登录 — Mozilla Firefox]","")
   Sleep(3000)
   Send("{TAB}")
   Send($sUserName)
   Send("{TAB}")
   Send($sPhone)
   Send("{TAB}")
   Send("")


EndFunc ;Euop_Res


Func Euop_Labs()
   Local $sUserNameEuopLabs='zhangjh@sh-stt.com'
   Run($sFirefox & " -no-remote -profile firefox_profiles/Euop_Labs " & $sUrlEuopLabsUser)
   Local $hWin = WinWaitActive("[管理员登录 — Mozilla Firefox]","")
   Sleep(3000)
   Send("{TAB}")
   Send($sUserNameEuopLabs)
   Send("{TAB}")
   Send($sPhone)
   Send("{TAB}")
   Send("")

EndFunc ;Euop_Labs


Func Euop_181()
   Run($sFirefox & " -no-remote -profile firefox_profiles/Euop_181 " & $sUrlEuop181User)
   Local $hWin = WinWaitActive("[管理员登录 — Mozilla Firefox]","")
   Sleep(5000)
   Send("{TAB}")
   Send($sUserName)
   Send("{TAB}")
   Send($sPhone)
   Send("{TAB}")
   Send("1")




EndFunc ;Euop_Labs

;测试Euop 181 环境
Func Euop_181_test()
    MsgBox(0,"Test Euop 181","Go")
EndFunc ;Euop_181_test


Func Euop_175()
   Run($sFirefox & " -no-remote -profile firefox_profiles/Euop_175 " & $sUrlEuop175User)
   Local $hWin = WinWaitActive("[管理员登录 — Mozilla Firefox]","")
   ; use tampermonkey scripts to fill the username
;~    Sleep(3000)
;~    Send("{TAB}")
;~    Send($sUserName)
;~    Send("{TAB}")
;~    Send($sPhone)
;~    Send("{TAB}")
;~    Send("1")


EndFunc ;Euop_Labs


Func Firefox_Default()
   Run($sFirefox & " -no-remote  " & $sUrlBing)
EndFunc;

Func Chrome_Default()
   Run($sChrome & " " & $sUrlBing)
EndFunc;

Func Opera_Default()
   Run($sOpera & " " & $sUrlBing)
EndFunc;


Func Edge_Default()
   Local $edge_test = FileExists(@WindowsDir & '\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\MicrosoftEdge.exe')
   If $edge_test = 1 Then
	  Local $edge = RunWait('explorer.exe shell:AppsFolder\Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge')
   EndIf
EndFunc;

Func Ie_Default()
   Run($sIe & " " & $sUrlBing)
EndFunc;

;普通账号申请
;自动创建一个word文档, 目前只有doc可以，docx的文档保存后再用word打开提示格式有问题
Func Word_Auto_Dev()
    ;create the document for dev account
    Local $oWord = _Word_Create()
    If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocOpen", _
        "Error creating a new Word application object." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
    
    ;open the template
    Local $sDocument = @ScriptDir & "\template\dev.doc"
    Local $oDoc = _Word_DocOpen($oWord, $sDocument, Default, Default, False)
    If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF", "Error opening '.\template\dev.doc'." & _
        @CRLF & "@error = " & @error & ", @extended = " & @extended)
    
    ;change the [[date]] to current date , such as 2021.6.7
    _Word_DocFindReplace($oDoc, "[[date]]", @YEAR & "." & @MON & "." & @MDAY)
    If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFindReplace", _
        "Error replacing text in the document." & @CRLF & "@error = " & @error & ", extended = " & @extended)
    
    ;ask for a reason
    ;如果输入为空则使用默认理由，如果有输入则使用输入理由
   
    Local $sRequestReason = InputBox("申请理由", "申请普通用户理由",$sDefaultReason,"", 600, -1, 0,0)
    ; change the [[reason]]
    _Word_DocFindReplace($oDoc, "[[reason]]", $sRequestReason)
    If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFindReplace", _
        "Error replacing [[reason]] in the document.", & @CRLF & "@error = " & @error & ", extended = " & @extended)
    
    ;save the document
    Local $sNewDocumentName = "普通用户权限申请表-" & @YEAR & @MON & @MDAY & " 0900-1800-张俊华.doc"
    _Word_DocSaveAs($oDoc, "E:\zjh\work\stt-it\普通账号申请记录" & "\" & $sNewDocumentName)
    If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocSaveAs", _
        "Error saving the word document." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
EndFunc ;Word_Auto_Dev
;


;非工作时间申请普通账号
;自动创建一个excel和一个word文档
Func Overnight_Auto_Dev()
    ;word文档
    ;create the document for dev account
    Local $oWord = _Word_Create()
    If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocOpen", _
        "Error creating a new Word application object." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
    
    ;open the template
    Local $sDocument = @ScriptDir & "\template\dev_overnight.doc"
    Local $oDoc = _Word_DocOpen($oWord, $sDocument, Default, Default, False)
    If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF", "Error opening '.\template\dev.doc'." & _
        @CRLF & "@error = " & @error & ", @extended = " & @extended)
    
    ;change the [[startDate]] to current day , such as 2021.06.07
    _Word_DocFindReplace($oDoc, "[[startDate]]", @YEAR & "." & @MON & "." & @MDAY)
    If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFindReplace", _
        "Error replacing startDate in the document." & @CRLF & "@error = " & @error & ", extended = " & @extended)
    
    ;change the [[endDate]] to next day
    Local $sNewDate = _DateAdd('d', 1, _NowCalcDate())
    Local $aNewDate, $aNewTime
    _DateTimeSplit($sNewDate, $aNewDate, $aNewTime)
    Local $sNextYear = $aNewDate[1]
    Local $sNextMonth = get_leading_zero($aNewDate[2])
    Local $sNextDay = get_leading_zero($aNewDate[3])
    
    _Word_DocFindReplace($oDoc, "[[endDate]]", $sNextYear & "." & $sNextMonth & "." & $sNextDay)
    If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFindReplace", _
        "Error replacing endDate in the document." & @CRLF & "@error = " & @error & ", extended = " & @extended)
    
    ;ask for a reason
    ;如果输入为空则使用默认理由，如果有输入则使用输入理由
    
    Local $sRequestReason = InputBox("申请理由", "申请普通用户理由",$sDefaultReason,"", 600, -1, 0,0)
    ; change the [[reason]]
    _Word_DocFindReplace($oDoc, "[[reason]]", $sRequestReason)
    If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFindReplace", _
        "Error replacing [[reason]] in the document.", & @CRLF & "@error = " & @error & ", extended = " & @extended)
    
    ;save the document
    Local $sNewDocumentName = "普通用户权限申请表-" & @YEAR & @MON & @MDAY & " 2300-" & $sNextYear & $sNextMonth & $sNextDay & " 0900-张俊华.doc"
    _Word_DocSaveAs($oDoc, "E:\zjh\work\stt-it\普通账号申请记录" & "\" & $sNewDocumentName)
    If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocSaveAs", _
        "Error saving the word document." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
        
    ;excel 文档
    Local $oExcel = _Excel_Open()
    If @error Then Exit MsgBox(16, "Excel UDF: _Excel_BookOpen failed", "Error Creating the excel application object.", & @CRLF & "@error = " & @erro & ", @extended= " & @extended)
    
    ;打开excel 模板
    Local $sWorkbook = @ScriptDir & "\template\vpn_overnight.xls"
    Local $oWorkbook = _Excel_BookOpen($oExcel, $sWorkbook)
    If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookOpen failed", "Error opening " & $sWorkbook & "." & @CRLF & "@error= " & @error & ", @extended= " & @extended)
    ;替换
    _Excel_RangeReplace($oWorkbook, Default, Default, "[[startYear]]", @YEAR)
    If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeReplace failed", "Error opening " & $sWorkbook & @CRLF & "@error= " & @error & ", @extended= " & @extended)
    _Excel_RangeReplace($oWorkbook, Default, Default, "[[startMonth]]", @MON)
    _Excel_RangeReplace($oWorkbook, Default, Default, "[[startDay]]", @MDAY)
    _Excel_RangeReplace($oWorkbook, Default, Default, "[[endYear]]", $sNextYear)
    _Excel_RangeReplace($oWorkbook, Default, Default, "[[endMonth]]", $sNextMonth)
    _Excel_RangeReplace($oWorkbook, Default, Default, "[[endDay]]", $sNextDay)
    _Excel_RangeReplace($oWorkbook, Default, Default, "[[reason]]", $sRequestReason)
    
    ;保存excel文档
    Local $sNewExcelFileName = "一级门户VPN和4A账号非工作时间使用申请表-张俊华-" & @YEAR & "-" & @MON & "-" & @MDAY & ".xls"
    _Excel_BookSaveAs($oWorkbook, "E:\zjh\work\stt-it\VPN和4a非工作时间使用申请记录\" & $sNewExcelFileName,$xlExcel8, True)
    If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookSaveAs failed", "@error= " & @error & ", @extended= " & @extended)
    ;关闭excel文档
    _Excel_Close($oExcel)
    
    
    
EndFunc ;Overnight_Auto_Dev
;
;get leading zero for date
Func get_leading_zero($i)
    ; 1 -> 01
    return StringFormat("%02i", $i)
EndFunc
;
;
;
;
;
;
