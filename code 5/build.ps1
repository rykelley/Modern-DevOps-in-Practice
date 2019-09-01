param (
    [string]$name = "myimage",
    [string]$tag = "latest",
    [switch]$help
)

$PACKAGE = "dkr"

if ($help) {
    Write-Host -ForegroundColor Green "
    -------------- Help ---------------
    Usage:
    $PACKAGE [options]

    Options:
    name - The name of the image.
    tag - The tag of the image.
    help - Show the help text.
    "
    Exit
}

docker build -t ${name}:${tag} .