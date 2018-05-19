#this script shows the cpu,ram,disk usage

    $computer = gc env:computername
    # Lets create a re-usable WMI method for CPU stats
    $ProcessorStats = Get-WmiObject win32_processor -computer $computer
    $ComputerCpu = $ProcessorStats.LoadPercentage 

    # Lets create a re-usable WMI method for memory stats
    $OperatingSystem = Get-WmiObject win32_OperatingSystem -computer $computer
    # Lets grab the free memory
    $FreeMemory = $OperatingSystem.FreePhysicalMemory
    $FreeMemoryinMb = [math]::truncate($FreeMemory/1024)
    # Lets grab the total memory
    $TotalMemory = $OperatingSystem.TotalVisibleMemorySize
    $TotalMemoryinMb = [math]::truncate($TotalMemory/1024)
    # Lets do some math for MB conversion
    $MemoryUsed =[math]::truncate(($TotalMemory - $FreeMemory)/1024)
    
    clear

    

    # Lets throw outputting
    Write-Host "Computer Name:" $computer
    Write-Host "CPU usage:" $ComputerCpu "%"
    Write-Host "Total Memory:" $TotalMemoryinMb "MB"
    Write-Host "Memory Use:" $MemoryUsed "MB"
    Write-Host "Free memory:" $FreeMemoryinMb "MB" 
    #get all disk info..
    Get-WmiObject Win32_LogicalDisk -filter "DriveType=3" -computer $computer | Select DeviceID,VolumeName,@{Name="Size(GB)";Expression={"{0:N1}" -f($_.size/1gb)}},@{Name="FreeSpace(GB)";Expression={"{0:N1}" -f($_.freespace/1gb)}} 

Read-Host "Press any key to continue............"
