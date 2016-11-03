Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);'
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr, 0)
$invocation = (Get-Variable MyInvocation).Value
$directorypath = Split-Path $invocation.MyCommand.Path 
$directorypath = $directorypath + '\Assets'
$Lun_Serial_Array=@()
$version = "v2.0.1"
[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
$Base64_Logo = "iVBORw0KGgoAAAANSUhEUgAAAFIAAABeCAYAAACw7kPgAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABl0RVh0U29mdHdhcmUAcGFpbnQubmV0IDQuMC4xMkMEa+wAAAb4SURBVHhe7ZxriFVVFMfvjAU9sB`
                Kraeaefe7cO5Nj9qCYCqKXRAyV2SSmBiVFiWY1ReCHQGsqSypC9ENGSfSyD70gCUSQ6OEYET0waCiJQkozmUobS0od+6991953n8e8Yk0NuP7w556zHvvs87vn7HPmChYKC3u61aN018cnFDJatOWwepRe8F7E9ALlFaqHtoIUsoIU`
                soIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIU8vgB2TOAz+0CPgDnjD/GHkdX5P5Cd3c9z+Dfqwozb/yxtYIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUso`
                IUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUsoIUci7IhVv6/3v39AmB7M0ff4x9V08Tz0ClUqlUKpVKpVKpVKqMmuN4s7cxHRzOCLlXXF0pim7k8KjV2Nh4`
                XFNT02Rya2trzn/Vn1XZmMXu2OU4fobD40uY2GFnTHR3a7GY88uGPZneoG4Jh0ctjLM8GGczhwdVe3v70aj90fXAh8pNTVM4PX4UTLBqY7bQ5Dnt9X+BRN0cVx94FafHj3ImSSe4ktNeIwA5oRxFF2IJmAd3xnFc5rgXYhX0rgnG+b`
                RSLJ5OpludyxJC3Qeu3tuY3xoaGo7nEq8oio5145ERop/q6jGvC2g5oqUrbzlBX9H1IH8KxaY0Np6M48xEz9xKFJ2FUB3FSXRuLVGEUltbXy6XG3JBwgOVUmlWta2qoUAiNgcH3O7yvs6YTSFQjPFTusYZY3ZzmRcAnO3zxuxC/+fB`
                /iIu80L+Upcnl0qlcxH7LIzB+3CsZSj3v4cittHnjVlN54fP/T4GI/YJzYfrZ2B/frlUWopjTMf+xgRITO7vYHtPqzEt9kgQBs4Fie0uF8+1MTvduovt0YHEgyXIP4aJ3xbsf4kSf5WQMH4CJLwjte+N/jXclga502+nTExwYUwDvD`
                MqcXwxYgtQ/wjiTyVAEmEkat8ErgA0HWMPlgOSBsUgB3x9HL+E/Q7k56P+O19vzBs8Bn3bW4P4z/h8kYztTqpxwnFPQnwf1x6sVCoxPfExxq8cO9wcRZdxuRVyaZDk93HMLrgb+cQXif7LbV8IkuLG/I7aJ+HF2H4rkcO6jvOehPmd`
                RkDhqeQESNzO14TfurUxz/IkMyCx7a8YeD3FnAgyYoc4RyBOpTjGGdHDBidwr6uD/djoWRnEX+OwFcZOg6S8v2ppLcS4u10e2+sojm0PErG/WuK43TawMO7DLk+24NIKCwgkxTDY82EcvjkPJOq+CWpWwTek7F9bsNhfTz0jBFmPnB`
                8bvVchRkDqmpub2xAbsP1Yiowx/t9P0iBbjDmTU16p42+zsSTIN21hIHsnxPGfQc0tnKrJJckOJD39cEC/sMN0i/W5/QDkXhcb1lF0J/WMBCTG7Uj0Vk/ij8C1nDEPcVsGZO5rHF0UtZo+jtVAxvEKW5gSxv7a1WD7Pg7X5JOwA0nC`
                rVlBg1+PQnuQcfyDjwM8ALwzmHE7XE09qBsWJHLr/bjDe4cDhrETIHEOmVewkjH3+xpjvqcYtsOHzcu2MBAW0qNwDnt8DR4ynKopSCZAkjDoTMTtbRTag8RtEMRfsE2B6JZIXxUhSGx/xGEvOnnk3NpKt9FeOom0kfPzwv486sV46T`
                Uy8eLeNnnyRMz92yD/NsXxGV6R/Vg+SraBhfgClydXjDmfUzUlClIgSRh4RVhDdiCxfWUQH8BT8FGaxFS8XGOf3rW24iQ3hS/BiD3ge+gNAbcJjYe66yiP/SeCfC9CiVccJ+T9VYv+D20sC5Igr4U76IUc+S9S+dk8Vu2KhFFP78S3`
                4xXnCoy9Avv+tRBjfIWW7Jx8AZwHEpqAgd4N6+jEOUdgng5zeUaNf2fDMWYNUrPErs3JtfgebsuI4Lg6eKBcLJ6TBpkAkLYxGzCMBYL98GEzaA/lsERNp56MwsJBQBboTyDk/RM4BAnVY1JLEU8+BKo+iIOvJUBca3+EQKwnp/ZurF`
                +3un0cox+vTCdyW57oyb7N9+M1LQfkXHz+EsbgAcRfDf/ERCxcI5/D5+t+n42eXficwS1ZETxvftfLE/1t6eroQcRhL8Qm4UA30e2Nz8cB5Q58e82cTohhdtqFH7c21pxLEK5D/XnovZaM7Yuq1YOL/4S09XQbpkG2tbVNpC8DwOfD`
                D8JdmOc0bvdCbQhytY3h73PUL4GXIT6b1ntbfCQoDySnhhRqMyCPaClIIdHPXQCxwTlcm4cSape7Hiw5mV+Vhleh8A9Udh1gHKKZxwAAAABJRU5ErkJggg=="
#===========================================================================
# Main Form
#===========================================================================
$inputXML = @"
<Window x:Class="WpfApplication1.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:WpfApplication1"
        mc:Ignorable="d"
        Title="NetApp Serial Converter $version" Height="165" Width="560" WindowStartupLocation="CenterScreen" ResizeMode="NoResize" Background="White" Visibility="Visible">
    <Window.TaskbarItemInfo>
         <TaskbarItemInfo/>
    </Window.TaskbarItemInfo>
    <Grid Margin="0">
        <Image x:Name="NetApp_Logo" HorizontalAlignment="Left" Height="94" Margin="10,6,0,0" VerticalAlignment="Top" Width="82" Stretch="Fill"/>
        <Button x:Name="Clear_Button" Content="Clear" HorizontalAlignment="Left" Margin="464,49,0,0" VerticalAlignment="Top" Width="75" IsDefault="True" Height="26"/>
        <Button x:Name="Convert_Button" Content="Convert" HorizontalAlignment="Left" Margin="464,80,0,0" VerticalAlignment="Top" Width="75" Height="26"/>
        <TextBlock x:Name="Main_Text_Block" HorizontalAlignment="Left" Margin="97,6,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="361" Height="38">
            Use this tool to convert NetApp serials to WWN ID's or WWN ID's to NetApp serials.
        </TextBlock>
        <TextBox x:Name="Serial_Number_Textbox" HorizontalAlignment="Left" Height="26" Margin="185,49,0,0" VerticalAlignment="Top" Width="273" MaxLines="1" MaxLength="12" Padding="3"/>
        <TextBox x:Name="WWN_ID_Textbox" HorizontalAlignment="Left" Height="26" Margin="185,80,0,0" VerticalAlignment="Top" Width="273" MaxLines="1" MaxLength="36" Padding="3,3,0,3"/>
        <Label x:Name="Serial_Label" Content="Serial Number" HorizontalAlignment="Left" Margin="97,49,0,0" VerticalAlignment="Top" Height="26" Width="88" FontWeight="Bold" Padding="0,5,3,5"/>
        <Label x:Name="WWN_ID_Label" Content="WWN ID" HorizontalAlignment="Left" Margin="97,80,0,0" VerticalAlignment="Top" Height="26" Width="88" FontWeight="Bold" Padding="0,5,5,5"/>
        <Button x:Name="Help_Button" Content="Help" HorizontalAlignment="Left" Margin="464,6,0,0" VerticalAlignment="Top" Width="75" IsDefault="True" Height="26"/>
        <TextBlock x:Name="Version_Text_Block" HorizontalAlignment="Right" TextAlignment="Right" Margin="0,0,2,2" TextWrapping="Wrap" VerticalAlignment="Bottom" Width="90" Height="15">
            <Bold>$version</Bold>
        </TextBlock>
    </Grid>
</Window>
"@
$inputXML = $inputXML -replace 'mc:Ignorable="d"','' -replace "x:N",'N'  -replace '^<Win.*', '<Window'
[xml]$xaml = $inputXML
$reader=(New-Object System.Xml.XmlNodeReader $xaml)
try{$Form=[Windows.Markup.XamlReader]::Load( $reader )}
catch{Write-Host "Unable to load Windows.Markup.XamlReader. Double-check syntax and ensure .net is installed."}
$xaml.SelectNodes("//*[@Name]") | %{Set-Variable -Name "WPF$($_.Name)" -Value $Form.FindName($_.Name)}
# Create a streaming image by streaming the base64 string to a bitmap streamsource
$bitmap = New-Object System.Windows.Media.Imaging.BitmapImage
$bitmap.BeginInit()
$bitmap.StreamSource = [System.IO.MemoryStream][System.Convert]::FromBase64String($base64_Logo)
$bitmap.EndInit()
$bitmap.Freeze()
$WPFNetApp_Logo.source = $bitmap
$Form.TaskbarItemInfo.Overlay = $bitmap
$Form.Icon = $bitmap
#===========================================================================
# Help Form
#===========================================================================
$help_XML = @"
<Window x:Class="WpfApplication1.HelpWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:WpfApplication1"
        mc:Ignorable="d"
        Title="Help" Height="200" Width="460" WindowStartupLocation="CenterScreen" ResizeMode="NoResize" ShowInTaskbar="False" Background="White" Visibility="Visible">
    <Grid Margin="0">
        <TextBlock x:Name="Help_Text_Block" HorizontalAlignment="Left" Margin="10,10,10,10" TextWrapping="Wrap" VerticalAlignment="Top" Width="440" Height="180">
            <Bold><Underline>NetApp Serial Converter Help</Underline></Bold><LineBreak />
            <LineBreak />
            <Bold>Serial Number to WWN ID Notes</Bold><LineBreak />
            NetApp Serial numbers must be 12 characters long <LineBreak />
            <LineBreak />
            <Bold>WWN ID to Serial Number Notes</Bold> <LineBreak />
            NetApp WWN ID's must be 36 characters long <LineBreak />
            When Converting WWN ID's ensure that the WWN ID contains the 'naa.60a98000' <LineBreak />
        </TextBlock>
        <TextBlock x:Name="Version_Text_Block" HorizontalAlignment="Right" TextAlignment="Right" Margin="0,0,2,2" TextWrapping="Wrap" VerticalAlignment="Bottom" Width="90" Height="15">
            <Bold>$version</Bold>
        </TextBlock>
    </Grid>
</Window>
"@       
$help_XML = $help_XML -replace 'mc:Ignorable="d"','' -replace "x:N",'N'  -replace '^<Win.*', '<Window'
[xml]$help_xaml = $help_XML
#===========================================================================
# Functions
#===========================================================================
Function help_menu () 
    {
        $help_reader=(New-Object System.Xml.XmlNodeReader $help_xaml)
        try{$help_Form=[Windows.Markup.XamlReader]::Load( $help_reader )}
        catch{Write-Host "Unable to load Windows.Markup.XamlReader. Double-check syntax and ensure .net is installed."}
        $help_Form.ShowDialog() | out-null
        return
    }

Function error_message ($Error_Title, $Error_Message) 
    {
        $error_XML = @"
<Window x:Class="WpfApplication1.ErrorWindow"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:local="clr-namespace:WpfApplication1"
    mc:Ignorable="d"
    Title="Error Detected" Height="150" Width="300" WindowStartupLocation="CenterScreen" ResizeMode="NoResize" ShowInTaskbar="False" Background="White" Visibility="Visible">
    <Grid Margin="0">
        <TextBlock x:Name="Error_Text_Title" HorizontalAlignment="Left" Margin="5,10,10,5" TextWrapping="Wrap" VerticalAlignment="Top" Width="270" Height="20">
            <Bold>$Error_Title</Bold>
        </TextBlock>
        <TextBlock x:Name="Error_Text_Block" HorizontalAlignment="Left" Margin="5,30,10,5" TextWrapping="Wrap" VerticalAlignment="Top" Width="270" Height="60">
            $Error_Message
        </TextBlock>
    <Button x:Name="Error_OK_Button" Content="OK" HorizontalAlignment="Left" Margin="112.5,74,0,0" VerticalAlignment="Top" Width="75" Height="26"/>
    </Grid>
</Window>
"@      
        $error_XML = $error_XML -replace 'mc:Ignorable="d"','' -replace "x:N",'N'  -replace '^<Win.*', '<Window'
        [xml]$error_xaml = $error_XML
        $error_reader=(New-Object System.Xml.XmlNodeReader $error_xaml)
        try{$error_Form=[Windows.Markup.XamlReader]::Load( $error_reader )}
        catch{Write-Host "Unable to load Windows.Markup.XamlReader. Double-check syntax and ensure .net is installed."}
        $error_xaml.SelectNodes("//*[@Name]") | %{Set-Variable -Name "WPF_$($_.Name)" -Value $error_Form.FindName($_.Name)}
        $WPF_Error_OK_Button.Add_Click({$error_Form.Close()})
        $error_Form.ShowDialog() | out-null
    }
Function clear_form () 
    {
        $WPFSerial_Number_Textbox.Text = ""
        $WPFWWN_ID_Textbox.Text = ""
    }
Function convert_value () 
    {
        $LUN_Serial = $WPFSerial_Number_Textbox.Text
        $LUN_WWN_ID = $WPFWWN_ID_Textbox.Text
        if($LUN_Serial -eq "" -and $LUN_WWN_ID -eq "")
            {
                $Error_Title = "No Value has been entered."
                $Error_Message = "Either enter a value into the Serial Number textbox or the WWN ID textbox."
                error_message $Error_Title $Error_Message
                return
            }
        if($LUN_Serial -ne "" -and $LUN_WWN_ID -ne "")
            {
                $Error_Title = "Too any values entered."
                $Error_Message = "Only one value should be entered"
                error_message $Error_Title $Error_Message
                return
            }
        if($LUN_WWN_ID -eq "" -and $LUN_Serial.length -ne 12)
            {
                $Error_Title = "Serial Number incorrect length"
                $Error_Message = "The NetApp Serial Number must be 12 characters long"
                error_message $Error_Title $Error_Message
                return
            }
        if($LUN_Serial -eq "" -and $LUN_WWN_ID.length -ne 36 )
            {
                $Error_Title = "WWN ID is incorrect length"
                $Error_Message = "WWN ID must be 36 characters long"
                error_message $Error_Title $Error_Message
                return
            }
        if($LUN_WWN_ID -eq "" -and $LUN_Serial.length -eq 12)
            {
                $wwn = 'naa.60a98000'
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
                        $wwn += $hex
                    }
                $WPFWWN_ID_Textbox.Text = $wwn
                return
            }
        if($LUN_WWN_ID -notlike "naa.*")
            {
                write-host "You must include the 'naa.' part of the WWN ID"
                return
            }
	    If (($LUN_WWN_ID.Split(".")[1].Substring(0,8)) -eq "60a98000") 
            {
		        $WWN=($LUN_WWN_ID.Split(".")[1]).Substring(8,24)
		        $WWN -split "(\w{2})"|ForEach-Object {
			            If ($_ -ne "") 
                            {
				                $ThisHex=$_
				                $ThisDec=[Convert]::ToInt16($ThisHex,16)
				                $ThisChar=[CHAR][BYTE]$ThisDec
				                $Lun_Serial_Array+=$ThisChar
				            }
			        }
	            $WPFSerial_Number_Textbox.Text = $Lun_Serial_Array -join ''
		    }
        else
            {
                $Error_Title = "Error Encountered"
                $Error_Message = "This WWN ID does not appear to be a NetApp LUN"
                error_message $Error_Title $Error_Message
                return
                write-host "This WWN ID does not appear to be a NetApp LUN"
                return
            }
    }
$WPFHelp_Button.Add_Click({help_menu})
$WPFClear_Button.Add_Click({clear_form})
$WPFConvert_Button.Add_Click({convert_value})
$Form.ShowDialog() | out-null