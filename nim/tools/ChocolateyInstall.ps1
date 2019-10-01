# File:          ChocolateyInstall.ps1
# Description:   Installation of the Nim programming language
# Author:        Arthur Zubarev
# Email:         arthurz at gmx dot com
# Revision:      0.0.3
# Last Modified: Tue Oct 01 2019 1:40 PM UTC

$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://nim-lang.org/download/nim-1.0.0_x32.zip'
$url64    = 'https://nim-lang.org/download/nim-1.0.0_x64.zip'

$packageArgs = @{
  packageName    = 'nim'
  unzipLocation  = $toolsDir
  url            = $url
  url64          = $url64
  checksum       = 'b41aa24ad8a611d051cf182e112e8d7a7785beb696e5903432eb273ae3d7d4e6'
  Checksum64     = 'f20e4f2dd4014bf5765d2d700c7d8822ccc8e56563a8849ee5f645af71142cbf'
  checksumType   = 'sha256'
  checksumtype64 = 'sha256'
}

Write-Output "The installation checks for the presence of a C compiler and can install MingW, the GNU C compiler for Windows."

Install-ChocolateyZipPackage @packageArgs

$AllUsrProf = Get-Childitem -Path Env:ALLUSERSPROFILE
$FinishExe = "$($AllUsrProf.Value)\chocolatey\lib\nim\tools\nim-1.0.0\finish.exe"

Write-Output "Execute $FinishExe to attempt to register Nim 1.0.0 and its tools on your PATH."
Write-Output "If you have previous version(s) of Nim on your PATH consider removing these entries."
