@echo off

if not defined BuildConfiguration (
    set "BuildConfiguration=Release"
)

if not defined DOTNET_INSTALL_DIR (
    set "DOTNET_INSTALL_DIR=%LocalAppData%\Microsoft\dotnet"
)

if not defined DOTNET_VERSION (
    set DOTNET_VERSION=2.0.1-servicing-006924
)

if not defined FeedTasksPackage (
    set FeedTasksPackage=Microsoft.DotNet.Build.Tasks.Feed
)

if not defined FeedTasksPackageVersion (
    set FeedTasksPackageVersion=1.0.0-prerelease-02203-01
)

set "WebSdkRoot=%~dp0"
set "WebSdkRoot=%WebSdkRoot:~0,-7%"
set "WebSdkReferences=%WebSdkRoot%\references\"
set "WebSdkSource=%WebSdkRoot%\src\"
set "WebSdkBuild=%WebSdkRoot%\build\"
set "WebSdkPublishBin=%WebSdkRoot%\src\Publish\Microsoft.NET.Sdk.Publish.Tasks\bin\"

set "PATH=%PATH%;%WebSdkBuild%"

REM Only required for the signing packages
if defined ProgramFiles(x86) (
    set "WebSdkProgramFiles=%ProgramFiles(x86)%"
) else (
    set "WebSdkProgramFiles=%ProgramFiles%"
)

if exist "%WebSdkProgramFiles%\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\MSBuild.exe" (
    set "WebSdkMSBuildPath=%WebSdkProgramFiles%\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin"
) else (
    set "WebSdkMSBuildPath=%WebSdkProgramFiles%\MSBuild\14.0\Bin"
)

set "PATH=%PATH%;%WebSdkMSBuildPath%"