


<%











' WScript.run "cmd.exe /C copy C:\github\burc\build\app\outputs\bundle\release\app-release.aab C:\github\burc\yayin\akrep\app-release.aab "






Function kopyala(adi)

if request("id")="" then
Set WScript = Server.CreateObject("WScript.Shell")
paketadi = WScript.run ("cmd.exe /C flutter pub run change_app_package_name:main com.shemaster."&adi&"" ,False)
If paketadi  = 0 Then
   paketadiis =1
   Response.Redirect "/?id=1"

else
    sErr  = "Paket Adı Değiştirme: " & paketadi
    Response.Redirect "/?id="&sErr 
end If
end if


if request("id") =1 then
Set WScript = Server.CreateObject("WScript.Shell")
adi = WScript.run ("cmd.exe /C flutter pub run flutter_app_name" ,False)
If adi  = 0 Then
   Response.Redirect "/?id=2"
else
    sErr  = "Adı Değiştirme: " & adi
    Response.Redirect "/?id="&sErr 
end If
end if


if request("id")=2 then
Set WScript = Server.CreateObject("WScript.Shell")
icon = WScript.run ("cmd.exe /C flutter pub run flutter_launcher_icons:main" ,False)
If icon  = 0 Then
   Response.Redirect "/?id=3"
else
    sErr  = "icon Değiştirme: " & adi
    Response.Redirect "/?id="&sErr 
end If
end if


if request("id")=3 then
Set WScript = Server.CreateObject("WScript.Shell")
splash = WScript.run ("cmd.exe /C flutter pub run flutter_native_splash:create" ,False)
If splash  = 0 Then
   Response.Redirect "/?id=4"
else
    sErr  = "splash Değiştirme: " & adi
    Response.Redirect "/?id="&sErr 
end If
end if


if request("id")=4 then
Set WScript = Server.CreateObject("WScript.Shell")
appbundle = WScript.run ("cmd.exe /C flutter build appbundle" ,False)
If appbundle  = 0 Then
   Response.Redirect "/?id=5"
else
    sErr  = "appbundle Değiştirme: " & adi
    Response.Redirect "/?id="&sErr 
end If
end if


if request("id")=5 then
Set WScript = Server.CreateObject("WScript.Shell")
kopya = WScript.run ("cmd.exe /C copy C:\github\burc\build\app\outputs\bundle\release\app-release.aab C:\github\burc\yayin\"&adi&"\app-release.aab" ,False)
If kopya  = 0 Then
   Response.Redirect "/?id=6"
else
    sErr  = "kopya Değiştirme: " & adi
    Response.Redirect "/?id="&sErr 
end If
end if


End Function

 
 kopyala("basak")
 

%>

---------------<br>
<%=request("id")%>
---------------<br>

<a href="/">Yenile</a>