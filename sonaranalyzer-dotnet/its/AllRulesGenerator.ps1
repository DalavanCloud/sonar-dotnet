﻿$ErrorActionPreference = "Stop"

$max = 10000
@"
<?xml version="1.0" encoding="utf-8"?>
<RuleSet Name="AllSonarAnalyzerRules" Description="Ruleset used to test for rule regressions." ToolsVersion="14.0">
<!-- AD0001, the analyzer catching other analyzer exceptions, should be enabled at Error level -->
  <Rules AnalyzerId="Roslyn.Core" RuleNamespace="Roslyn.Core">
    <Rule Id="AD0001" Action="Error" />
  </Rules>

<!-- This list is just hardcoded for now with plausible existing & upcoming rule IDs -->
<!-- It would be better to generate the actual list from the analyzer assemblies -->
  <Rules AnalyzerId="SonarAnalyzer.CSharp" RuleNamespace="SonarAnalyzer.CSharp">
"@
for ($i = 0; $i -le $max; $i++) { Write-Output "    <Rule Id=""S$i"" Action=""Warning"" />" }
@"
  </Rules>
  <Rules AnalyzerId="SonarAnalyzer.VisualBasic" RuleNamespace="SonarAnalyzer.VisualBasic">
"@
for ($i = 0; $i -le $max; $i++) { Write-Output "    <Rule Id=""S$i"" Action=""Warning"" />" }
@"
  </Rules>
</RuleSet>
"@
