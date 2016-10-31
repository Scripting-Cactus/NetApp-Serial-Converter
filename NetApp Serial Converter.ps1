$version =  "v1.1.6"
$host.ui.RawUI.WindowTitle = “NetApp Serial Converter $version”
Function menu ()
    {
        Clear-Host
        $origin = ""
        $function_select = 0
        Do
            {
                Clear-Host
                write-host "NetApp Serial Converter"
                write-host "***********************"
                write-host ""
                write-host "1. Convert Netapp Serial Number to WWN ID"
                write-host "2. Convert WWN ID to NetApp Serial Number"
                write-host ""
                write-host "Note: Type 'help' at any prompt for addtional options"
                write-host ""
                write-host "Version: $version"
                write-host ""
                $fuction_select = read-host -prompt "Option"
            }
        until ($fuction_select -eq "1" -or 
               $fuction_select -eq "2" -or 
               $fuction_select -eq "menu" -or 
               $fuction_select -eq "quit" -or 
               $fuction_select -eq "exit" -or 
               $fuction_select -eq "help" -or 
               $fuction_select -eq "?")
        Switch ($fuction_select)
            {
                "1" 
                    { 
                        sub_menu_1
                        return
                    }
                "2" 
                    {
                        sub_menu_2
                        return
                    }
                "menu" 
                    {
                        menu
                        return
                    }
                {($_ -eq "help") -or ($_ -eq "?")} 
                    { 
                        help_menu
                        return
                    }
                {($_ -eq "exit") -or ($_ -eq "quit")} 
                    { 
                        return 
                    }
            }
    }
Function help_menu () 
    {
        Clear-Host
        write-host "NetApp Serial Converter"
        write-host "***********************"
        write-host ""
        write-host "Serial Number to WWN ID Notes"
        write-host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        write-host ""
        write-host "NetApp Serial numbers must be 12 characters long"
        write-host ""
        write-host "WWN ID to Serial Number Notes"
        write-host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        write-host ""
        write-host "NetApp WWN ID's must be 36 characters long"
        write-host "All NetApp WWN ID's start with 'naa.60a98000'"
        write-host "When Converting WWN ID's, ensure that the WWN ID contains the 'naa.60a98000'"
        write-host ""
        write-host "General Notes"
        write-host "~~~~~~~~~~~~~"
        write-host ""
        write-host "Type 'exit' or 'quit' at any prompt to close the application"
        write-host "Type 'help' or '?' at any prompt to reach this menu"
        write-host ""
        write-host "Version = $version"
        write-host ""
        pause
        if($origin -eq "sub_menu_1")
            {
                sub_menu_1
                return
            }
        elseif($origin -eq "sub_menu_2")
            {
                sub_menu_2
                return
            }
        else
            {
                menu
                return
            }
    }
Function sub_menu_1 () 
    {
        Clear-Host
        write-host "NetApp Serial Converter"
        write-host "***********************"
        write-host ""
        write-host "Enter a Serial Number to be converted to a WWN ID"
        write-host ""
        $LUN_Serial = ""
        $LUN_Serial = Read-Host -Prompt 'Serial'
        if($LUN_Serial -eq "menu")
            {
                menu
                return
            }
        if($LUN_Serial -eq "help"-or $LUN_Serial -eq "?")
            {
                $origin = "sub_menu_1"
                help_menu
                return
            }
        if($LUN_Serial -eq "exit" -or $LUN_Serial -eq "quit")
            {
                return
            }
        if($LUN_Serial -eq "")
            {
                Clear-Host
                write-host "NetApp Serial Converter"
                write-host "***********************"
                write-host ""
                write-host "Serial Number is blank"
                write-host ""
                pause
                sub_menu_1
                return
            }
        if($LUN_Serial.length -ne 12)
            {
                Clear-Host
                write-host "NetApp Serial Converter"
                write-host "***********************"
                write-host ""
                write-host "Serial Number incorrect length"
                write-host "Serial Number must be 12 characters long"
                write-host ""
                pause
                sub_menu_1
                return
            }
        $wwn='naa.60a98000'
        $Lun_Serial_Array = @()
	    While ($LUN_Serial)
		    { 
		        $x,$LUN_Serial = ([char[]]$LUN_Serial).where({$_},'Split',1)
                $Lun_Serial_Array += $x
		    }
        foreach($key in $Lun_Serial_Array)
            {
                $ascii=''
                $hex=''
                $int = [int][char]$key;
	            $dec = [string]$int;
	            if($int -lt 100)
	                {
                        $ascii = $asciie + '0' +$dec;
	                }
	            else
	                {	
	                    $ascii = $ascii + $dec;
                    }
                $hex = [System.Convert]::ToString($ascii,16)
                $wwn+=$hex
            }
        $wwn
        pause
        menu
        return
    }
Function sub_menu_2 () 
    {
        Clear-Host
        write-host "NetApp Serial Converter"
        write-host "***********************"
        write-host ""
        write-host "Convert WWN ID to NetApp Serial Number"
        write-host ""
        $WWN_ID = ""
        $Lun_Serial = ""
        $WWN_ID = Read-Host -Prompt 'WWN ID'
        if($WWN_ID -eq "menu")
            {
                menu
                return
            }
        if($WWN_ID -eq "help"-or $WWN_ID -eq "?")
            {
                $origin = "sub_menu_2"
                help_menu
                return
            }
        if($WWN_ID -eq "exit" -or $WWN_ID -eq "quit")
            {
                return
            }
        if($WWN_ID -eq "")
            {
                Clear-Host
                write-host "NetApp Serial Converter"
                write-host "***********************"
                write-host ""
                write-host "WWN ID is is blank"
                write-host ""
                pause
                sub_menu_2
                return
            }
        if($WWN_ID.length -ne 36)
            {
                Clear-Host
                write-host "NetApp Serial Converter"
                write-host "***********************"
                write-host ""
                write-host "WWN ID is incorrect length"
                write-host "WWN ID must be 36 characters long"
                write-host ""
                pause
                sub_menu_2
                return
            }
        if($WWN_ID -notlike "naa.*")
            {
                Clear-Host
                write-host "NetApp Serial Converter"
                write-host "***********************"
                write-host ""
                write-host "You must include the 'naa.' part of the WWN ID"
                write-host ""
                pause
                sub_menu_2
                return
            }
        $Lun_Serial_Array=@()
	    If (($WWN_ID.Split(".")[1].Substring(0,8)) -eq "60a98000") 
            {
		        $WWN=($WWN_ID.Split(".")[1]).Substring(8,24)
		        $WWN -split "(\w{2})"|ForEach-Object {
			            If ($_ -ne "") 
                            {
				                $ThisHex=$_
				                $ThisDec=[Convert]::ToInt16($ThisHex,16)
				                $ThisChar=[CHAR][BYTE]$ThisDec
				                $Lun_Serial_Array+=$ThisChar
				            }
			        }
		    }
        else
            {
                Clear-Host
                write-host "NetApp Serial Converter"
                write-host "***********************"
                write-host ""
                write-host "This WWN ID does not appear to be a NetApp LUN"
                write-host ""
                pause
                sub_menu_2
                return
            }
	    $Lun_Serial=$Lun_Serial_Array -join ''
	    $Lun_Serial
        pause
        menu
        return
    }
menu