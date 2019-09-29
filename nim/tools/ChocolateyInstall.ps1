# File:          ChocolateyInstall.ps1
# Description:   Installation of Nim programming language
# Author:		     Arthur Zubarev
# Email:         arthurz at gmx dot com
# Revision:	     0.0.1
# Last Modified: Sun Sep 29 2019 16:16 PM UTC

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

Write-Output "The installer will now attempt to register Nim on your PATH."

$FinishExe = (Get-ChildItem $toolsDir -Filter 'finish.exe').FullName

$startProcessArgsFE = @{
      PassThru = $true
      NoNewWindow = $true
      FilePath = $FinishExe
}

$piFE = Start-Process @startProcessArgsFE
$piFE.WaitForExit()
exit $piFE.ExitCode
