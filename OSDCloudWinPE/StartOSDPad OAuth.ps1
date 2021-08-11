#Requires -RunAsAdministrator

#How To: Start OSDPad with OAuth Token
#OSDPad will load scripts from https://github.com/OSDeploy/OSDHelp/tree/main/OSDCloudDeploy
#OAuth Token enables OSDPad Child-Items
#Replace all the 'xxxx' with your OAuth Token

Edit-OSDCloud.winpe -StartOSDPad "OSDeploy OSDHelp OSDCloudDeploy -OAuth 'xxxxxxxxxxxxxxxxxxxx'"