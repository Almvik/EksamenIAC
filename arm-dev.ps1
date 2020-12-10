#tenantid = "bd0944c8-c04e-466a-9729-d7086d13a653"
#$Subscriptionid = "41082359-57d6-4427-b5d9-21e269157652"
#$credentials = Get-Credential
#Connect-AzAccount -ServicePrincipal -Credential $credentials -TenantId $tenantid -Environment AzureCloud -SubscriptionId $Subscriptionid

$rg = "arm-dev-rg-learnIT"
New-AzResourceGroup -Name $rg -Location 'West Europe' -Force

New-AzResourceGroupDeployment `
    -Name "arm-dev-learnIT" `
    -ResourceGroupName $rg `
    -TemplateFile './Eksamen/arm-eksamen.json' `
    -TemplateParameterFile './Eksamen/arm-eksamen.parameters-dev.json' 

New-AzResourceGroupDeployment `
    -Name "arm-dev-learnIT" `
    -ResourceGroupName $rg `
    -TemplateFile './Eksamen/arm-web-app.json' 

New-AzResourceGroupDeployment `
    -Name "arm-dev-learnIT" `
    -ResourceGroupName $rg `
    -TemplateFile './Eksamen/arm-sql.json' `
    -allowAzureIPs 'Yes'


Get-AzStorageAccountKey -ResourceGroupName $rg -AccountName storjgqjqtxryec540

#Gir:
#KeyName Value                                                                                    Permissions
#------- -----                                                                                    -----------
#key1    z4zy8JMpg2CdEdOuwzn11AI+LdJqR4Pye2P00SqTbDfO7kcOMeG8AiqoZue7T1KYVlmgGv6NgdPI0UhiJAmu3Q==        Full
#key2    dUmVWKvAiT1Wn2VkPJqa+TnntbYPClZsBbIZkAquausiM7e35dcwajqLUbGxI20qXjdlaC+Dj0i5GKKbAl5qeA==        Full
    
    
    