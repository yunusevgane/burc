<!--#include virtual="json.asp" -->



<%


Set oJSON = New aspJSON


Function kopyala(adi)
islem=""


Set HTTB = Server.CreateObject("Microsoft.XMLHTTP")
HTTB.Open "Get","C:/github/burc/pubspec.yaml",False
HTTB.SEnd
sayfatext = HTTB.ResponseText
Set HTTB = Nothing
if err then
else

a1="######--"
a2="--######"
Basla = InStr(1,sayfatext,a1,1) + Len(a1)
Bitir = InStr(Basla,sayfatext,a2,1) - Basla
title = Mid(sayfatext,Basla,Bitir)

sayfatext =Replace(sayfatext, title, adi, 1, -1, 1)
Set file_object = CreateObject("Scripting.FileSystemObject")
Set file = file_object.CreateTextFile("C:/github/burc/pubspec.yaml",True)
file.WriteLine(sayfatext)
file.Close

end if



Set WScript = Server.CreateObject("WScript.Shell")
paketadi = WScript.run ("cmd.exe /C flutter pub run change_app_package_name:main com.shemaster."&adi&"" ,0,true)
set WScript=nothing
If paketadi  = 0 Then
   islem="1"
else
   islem=sErr 
end If



if islem ="1" then
Set WScript = Server.CreateObject("WScript.Shell")
adidegis = WScript.run ("cmd.exe /C flutter pub run flutter_app_name" ,0,true)
set WScript=nothing
If adidegis = 0 Then
   islem="2"
else
   islem=sErr 
end If
end if


if islem="2" then
Set WScript = Server.CreateObject("WScript.Shell")
icon = WScript.run ("cmd.exe /C flutter pub run flutter_launcher_icons:main" ,0,true)
set WScript=nothing
If icon = 0 Then
   islem="3"
else
   islem=sErr 
end If
end if


if islem="3" then
Set WScript = Server.CreateObject("WScript.Shell")
splash = WScript.run ("cmd.exe /C flutter pub run flutter_native_splash:create" ,0,true)
set WScript=nothing
If splash = 0 Then
   islem="4"
else
   islem=sErr 
end If
end if


if islem=4 then
Set WScript = Server.CreateObject("WScript.Shell")
appbundle = WScript.run ("cmd.exe /C flutter build appbundle" ,0,true)
set WScript=nothing
If appbundle  = 0 Then
   islem="5"
else
   islem=sErr 
end If
end if


if islem="5" then
Set WScript = Server.CreateObject("WScript.Shell")
kopya = WScript.run ("cmd.exe /C copy C:\github\burc\build\app\outputs\bundle\release\app-release.aab C:\github\burc\yayin\"&adi&"app-release.aab" ,0,true)
set WScript=nothing
If kopya  = 0 Then
   islem=""
else
   sErr  = "kopya Değiştirme: " & adi
   islem=sErr  & "islem tamama"
end If
end if

End Function



Set fso = Server.CreateObject("Scripting.FilesystemObject")
Set klasor = fso.getfolder("C:/github/burc/yayin" ) 
Set altklasorler = klasor.subfolders 
For Each altk in altklasorler 
 islem=""
 kopyala(altk.name)
%>



<%=altk.name%>
<br>
<%Next%>

<br>
<br>
<%=islem%>
<br>

<a href="/">Yenile</a>