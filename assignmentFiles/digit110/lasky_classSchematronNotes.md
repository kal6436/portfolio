There are two banksy files
<pattern id="locationChecks">
<rule context="location[contains(., 'AU')]">
<assert test="number(@long) gt 100">
AU
</assert>
<assert test="number(@long) gt 0">
  error code
</assert>
<assert test="number(@lat) lt 0">
  error code
</assert>
<rule context="location[contains(., 'USA')]">
<assert test="@long &lt;= 0"> <!-- this is a general comp. it does not need number -->
USA must have neg lat
</assert>
<assert test="number(@lat) gt 0">
USA must have 
</assert>

lily's <!-- cool but not the best -->
<rule context="location">
<assert test="contains(.,'AU') or contains(.,'USA')">
  Country must be USA or AU
</assert>
<report test="number(@lat) gt 0 and contains(., 'AU')">Lat must be less than 0 if in AU</report>
<report test="number(@long) lt 100 and contains(., 'AU')">Long must be greater than 100 is in AU</report>

<report lt 0>
<report gt 0>
</rule>
