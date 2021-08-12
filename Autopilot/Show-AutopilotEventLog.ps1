$MDMEventLog = @'
<ViewerConfig>
	<QueryConfig>
		<QueryParams>
			<UserQuery/>
		</QueryParams>
		<QueryNode>
			<Name LanguageNeutralValue="MDMDiagnosticsTool">MDMDiagnosticsTool</Name>
			<Description>MDMDiagnosticsTool</Description>
			<SuppressQueryExecutionErrors>1</SuppressQueryExecutionErrors>
			<QueryList>
				<Query>
					<Select Path="Microsoft-Windows-AAD/Operational">*</Select>
					<Select Path="Microsoft-Windows-AppXDeployment-Server/Operational">*</Select>
					<Select Path="Microsoft-Windows-AssignedAccess/Admin">*</Select>
					<Select Path="Microsoft-Windows-AssignedAccess/Operational">*</Select>
					<Select Path="Microsoft-Windows-AssignedAccessBroker/Admin">*</Select>
					<Select Path="Microsoft-Windows-AssignedAccessBroker/Operational">*</Select>
					<Select Path="Microsoft-Windows-Crypto-NCrypt/Operational">*</Select>
					<Select Path="Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider/Admin">*</Select>
					<Select Path="Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider/Operational">*</Select>
					<Select Path="Microsoft-Windows-ModernDeployment-Diagnostics-Provider/Autopilot">*</Select>
					<Select Path="Microsoft-Windows-ModernDeployment-Diagnostics-Provider/ManagementService">*</Select>
					<Select Path="Microsoft-Windows-Provisioning-Diagnostics-Provider/Admin">*</Select>
					<Select Path="Microsoft-Windows-Shell-Core/Operational">*</Select>
					<Select Path="Microsoft-Windows-User Device Registration/Admin">*</Select>
				</Query>
			</QueryList>
		</QueryNode>
	</QueryConfig>
</ViewerConfig>
'@
$MDMEventLog | Set-Content -Path "$env:ProgramData\Microsoft\Event Viewer\Views\MDMDiagnosticsTool.xml"
Restart-Service -Name EventLog -Force -ErrorAction Ignore
Show-EventLog