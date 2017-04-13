#Enable and Disable WSH
#Coded By Karem Ali
#Need Administrative Rights

If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(

   [Security.Principal.WindowsBuiltInRole] “Administrator”))

{

 Write-Warning “You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!”

 Pause
 Break

}

$path = "HKLM:\SOFTWARE\Microsoft\Windows Script Host\Settings"
$name = "Enabled"
$valid = Test-Path $path
if ( $valid -eq $false)
{
    New-Item -Path $path

}
echo " Choose an option " " 1- Enable WSH " " 2- Disalbe WSH "
$option = Read-Host " Enter : "
    if ( $option -eq 1 )
    {
            New-ItemProperty -Path $path -Name $name -Value  1 -PropertyType DWORD -Force
            echo " Windows Script Host Has Been Enabled "
        
    }
    elseif ($option -eq 2 )

    {
        New-ItemProperty -Path $path -Name $name -Value  0 -PropertyType DWORD -Force
         echo " Windows Script Host Has Been Disabled "
        

       }
       else {

        echo " choose 1 or 0 Idoiot "
       }

