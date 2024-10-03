# List of useful Powershell environment variables

1. `$PROFILE`
   Path to the PowerShell profile script. You can edit this to customize your environment.

1. `$HOME`
   The user's home directory, equivalent to %USERPROFILE% in the Windows Command Prompt.

1. `$PSHOME`
   Path to the folder where PowerShell is installed.

1. `$PWD`
   Represents the current directory (working directory).

1. `$env:PATH`
   Shows or sets the system PATH environment variable. You can use $env:PATH += ";C:\path\to\add" to append a path.

1. `$env:USERNAME`
   Displays the current user's username.

1. `$env:COMPUTERNAME`
   Displays the name of the computer.

1. `$env:TEMP or $env:TMP`
   Location of the temporary files directory.

1. `$PSVersionTable`
   Displays details about the PowerShell version, including the runtime and edition.

1. `$LASTEXITCODE`
   Stores the exit code of the last Windows-based application you ran.

1. `$Error`
   Contains a collection of error objects from the most recent command.

1. `$null`
   Represents a null value, useful for suppressing output or checking for null.

Use `Get-Variables` to get all PowerShell variables

1. `h`
   The alias for history
