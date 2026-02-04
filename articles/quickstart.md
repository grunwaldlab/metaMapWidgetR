# quickstart

## Quick start

This package includes multiple example data sets that are automatically
loaded with the package. After installation, simply run the lines below
to test randomly generated data and customized test columns:

``` r
library(metaMapWidgetR)

example_data_path <- system.file('extdata', 'data.csv', package = 'metaMapWidgetR')

meta_map_widget(example_data_path)
```

Or, to get an idea of how this would work with real data:

``` r
library(rgbif)
occ_data <- occ_search(scientificName = "Bombus franklini")
occ_table <- occ_data$data
occ_table$latitude <- occ_table$decimalLatitude
occ_table$longitude <- occ_table$decimalLongitude
meta_map_widget(occ_table, sizeVar='individualCount', colorVar='county')
```
