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

Install-ChocolateyZipPackage @packageArgs
