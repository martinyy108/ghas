# Load PowerPoint Application
$ppt = New-Object -ComObject PowerPoint.Application
$ppt.Visible = $true

# Create a new presentation
$presentation = $ppt.Presentations.Add()

# Path to the folder containing the PPTX files
$folderPath = "D:\slides"

# Loop through the files named github-adv-sec-lesson-01.pptx through 16.pptx
for ($i = 1; $i -le 16; $i++) {
    $fileName = "github-adv-sec-lesson-{0:00}.pptx" -f $i
    $filePath = Join-Path -Path $folderPath -ChildPath $fileName
    if (Test-Path -Path $filePath) {
        $sourcePresentation = $ppt.Presentations.Open($filePath, $false, $true, $false)
        if ($null -ne $sourcePresentation) {
            foreach ($slide in $sourcePresentation.Slides) {
                $slide.Copy()
                if ($null -ne $presentation.Slides) {
                    $presentation.Slides.Paste()
                } else {
                    Write-Output "Failed to paste slide from $filePath."
                }
            }
            $sourcePresentation.Close()
        } else {
            Write-Output "Failed to open $filePath."
        }
    } else {
        Write-Output "File $filePath does not exist."
    }
}

# Save the combined presentation
$outputPath = "D:\slides\combined_presentation.pptx"
$presentation.SaveAs($outputPath)
$presentation.Close()

# Quit PowerPoint
$ppt.Quit()
