param ()

$executingScriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

Write-Host "Running helm upgrade:" -ForegroundColor Yellow
helm upgrade logging "$executingScriptDirectory" --install --wait --set CollectClusterLogs="false"

Write-Host "Retrieving rollout status:" -ForegroundColor Yellow
kubectl rollout status "deployment/logging-kibana"

Write-Host "Deployment:" -ForegroundColor Yellow
kubectl get "deployment/logging-kibana" -o yaml