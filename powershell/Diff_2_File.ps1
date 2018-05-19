#this script find difference between two text files

Write-Host "Enter the file1 name:"
$file1=Read-Host        #get first file name
Write-Host "Enter the file2 name"
 $file2=Read-Host #get 2nd file name
if(Test-Path $file1) #test file exits or not
 {
    if(Test-Path $file2) #test file exits or not
    {
        Write-Host "==========================================="
        Write-Host "These words are in file2 but not in file1 :"
        Write-Host "==========================================="
        $cont =  Get-Content $file2 #read file
        foreach ( $i in $cont)#get line
            {
                $bool = "false" #boolian testing variable
                $cont2 = Get-Content $file1 #read file
                foreach($j in $cont2) #get line
                {
                    if($j -eq $i) #test file1 with file2
                    {
                        $bool = "true"
                    }
                   
            
                }
                if($bool -eq "false")#check test result
                {
                    Write-Host $i #print those words that not inside of file1
                }
            }

    
    }
    else
    {
        Write-Error "File2 not found!"
    }
 }
 else
 {
    Write-Error "File1 not found!"
 }

Read-Host "Press ENTER to continue........................."    