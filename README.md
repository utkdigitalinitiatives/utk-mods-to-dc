## UTK MODS to DC Transform ##

The XSL transforms in this repository are meant to be deployed in Islandora. Use the directories/files per their names in the following file paths, noting that the `islandora_oai` module uses a slightly different name:

```
$DRUPAL_HOME/sites/all/modules/islandora_batch/transforms/mods_to_dc.xsl
$DRUPAL_HOME/sites/all/modules/islandora_importer/xsl/mods_to_dc.xsl
$DRUPAL_HOME/sites/all/modules/islandora_oai/transforms/mods_to_dc_oai.xsl
$DRUPAL_HOME/sites/all/modules/islandora_xml_forms/builder/transforms/mods_to_dc.xsl
```

### Caveats ###
* The `institutional-repository/mods_to_dc.xsl` only serializes `dc:title`, `dc:date`, and `dc:description`.
* There is not a `mods_to_dc_oai.xsl` for the Trace IR at this point (2018-07-25).
