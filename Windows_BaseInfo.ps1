
##Live Triage in Envioment
echo %DATE% %TIME%

hostname
systeminfo
psloggedon \\computername 				#users logged on to the system

##Now grab all users on the system
whoami
net users								#all users
net local group administrators
net group administrators
route print




#Below is the script to run admin scripts with escilation 

# Get the ID and security principal of the current user account
$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)
 
# Get the security principal for the Administrator role
$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator
 
# Check to see if we are currently running "as Administrator"
if ($myWindowsPrincipal.IsInRole($adminRole))
   {
   # We are running "as Administrator" - so change the title and background color to indicate this
   $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"
   $Host.UI.RawUI.BackgroundColor = "DarkBlue"
   clear-host
   }
else
   {
   # We are not running "as Administrator" - so relaunch as administrator
   
   # Create a new process object that starts PowerShell
   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
   
   # Specify the current script path and name as a parameter
   $newProcess.Arguments = $myInvocation.MyCommand.Definition;
   
   # Indicate that the process should be elevated
   $newProcess.Verb = "runas";
   
   # Start the new process
   [System.Diagnostics.Process]::Start($newProcess);
   
   # Exit from the current, unelevated, process
   exit
   }
 
# Run your code that needs to be elevated here
#This will get al the security logs and explot them. This will be the last powershell script ran on the computer until debugged.

get-wmiobject -query "Select * from Win32_NTLogEvent Where Logfile = 'Security'"

If you want to check on multiple computers, you can do this:

$computers=get-content computers.txt #computers.txt is a list with computernames, one name on each row ($computers is a collection with computernames to save)
foreach($computer in $computers)
{
    get-wmiobject -query "Select * from Win32_NTLogEvent Where Logfile = 'Security'" -computername $computer | export-csv $computer.csv -NoTypeInformation
}

You can also look for specific events by changing the Where part of the Get-WmiObject query. For example like this
(all on one line)

get-wmiobject -query "Select * from Win32_NTLogEvent Where Logfile = 'Security' and EventCode = 644 and EventType=4" -computername $computer | export-csv $computer.csv -NoTypeInformation



#$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
#Admin requried for scipt
 
