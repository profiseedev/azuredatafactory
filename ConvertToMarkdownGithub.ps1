param ($folderName, $documentName)

write-host "Converting" $documentName

cd $folderName

#Use pandoc to convert the Word doc to a GitHub Markdown doc.
#pandoc extracts images to a folder called media.  All those images have the 'image' prefix.
del media\*.png
pandoc "$documentName.docx" -f docx -t gfm -o "$documentName.md" --extract-media=.

#cd media
##Since all image files will ultimately all be in one common media folder, we need to rename the files to keep them unique.
#$imageName = $folderName + "_"
#dir | rename-item -NewName {$_.name -replace "image", $imageName}

##Copy the renamed image file to the combined media folder
#copy-item $imageName*.png ..\..\media

#cd..
##Rename the image link source in the markdown doc.
#(Get-Content "$documentName.md").replace('image', $imageName) | Set-Content "$documentName.md"

##Copy the Markdown document to the common folder.
#copy-item "$documentName.md" ..\

cd..
